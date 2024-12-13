import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

void handleApiResponse(BuildContext context, ApiResponse response,
    {String? successMessage,
    String? errorMessage,
    Function(dynamic)? onSuccess,
    Function(dynamic)? onError}) {
  if (response.success) {
    onSuccess?.call(response.data);
    if (successMessage != null && successMessage.isNotEmpty) {
      context.createSnackbar(successMessage);
    }
  } else {
    if (onError != null) {
      onError(response.data);
      if (errorMessage != null && errorMessage.isNotEmpty) {
        context.createSnackbar(errorMessage);
      }
    } else {
      context.createSnackbar(errorMessage ?? response.message);
      // context.scaffold.showSnackBar(SnackBar(
      //   content: Text(response.message),
      //   action: SnackBarAction(
      //     label: "Ok",
      //     onPressed: () => context.scaffold.clearSnackBars(),
      //   ),
      // ));
    }
  }
}

Future<ApiResponse> handleApiEndpoint(
    Function request, String method, String url,
    {dynamic data,
    bool auth = true,
    String contentType = 'application/json',
    dynamic Function(double)? uploadProgress}) async {
  // Combine all arguments into a Map
  final args = {
    'request':
        request, // Functions are not serializable; avoid passing directly
    'method': method,
    'url': url,
    'data': data, // Ensure data is serializable
    'apiToken': Storage.to.apiToken,
    'auth': auth,
    'contentType': contentType,
    'uploadProgress': uploadProgress
  };

  // Use compute to handle the operation
  return await compute(handleApiEndpointIsolate, args);
}

Future<ApiResponse> handleApiEndpointIsolate(Map<String, dynamic> args) async {
  // Extract arguments from the Map
  String method = args['method'];
  dynamic data = args['data'];
  final String apiToken = args['apiToken'];
  final request = args['request'];
  final String url = args['url'];
  final bool auth = args['auth'];
  final String contentType = args['contentType'];
  final dynamic Function(double)? uploadProgress = args['uploadProgress'];

  try {
    method = method.toLowerCase();
    Map<String, String>? headers =
        auth ? {"Authorization": "Bearer $apiToken"} : null;

    if (data != null && data is Map<String, dynamic>) {
      // data = await compute(castXFileMultipart, data);
      data = castXFileMultipart(data);
      if (method == 'post' || method == 'put') {
        data = FormData(data);
      }
    }

    final Response response = await request(
      url,
      method,
      query: method == 'get' ? data : null,
      body: ['post', 'put', 'patch'].contains(method) ? data : null,
      headers: headers,
      contentType: contentType,
      uploadProgress: uploadProgress,
    );

    if (response.body == null) {
      return ApiResponse.error(
        status: response.status.code,
        message: "Problema di connessione",
        data: null,
      );
    }

    final Map<String, dynamic> body = response.body;

    if (response.status.code == 401 && body["message"] == "Unauthenticated.") {
      return ApiResponse.error(
        status: 401,
        message: "Unauthorized",
        data: null,
      );
    }

    return ApiResponse(
        status: response.status.code,
        message: body["message"],
        data: body["data"],
        success: body.containsKey("success") && body["success"]);
  } catch (e) {
    e.printError();
    e.printInfo();
    return ApiResponse.error(
      status: 500,
      message: e.toString(),
      data: null,
    );
  }
}

Map<String, dynamic> castXFileMultipart(Map<String, dynamic> data) {
  for (MapEntry el in data.entries) {
    if (el.value is XFile) {
      XFile xfile = el.value as XFile;
      // final fileBytes = await el.value.readAsBytes();
      final fileBytes = File(xfile.path);
      final multipartFile = MultipartFile(fileBytes,
          filename: el.value.name, contentType: 'application/octet-stream');
      data[el.key] = multipartFile;
    }
  }
  return data;
}
