import 'dart:io';

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
  try {
    method = method.toLowerCase();
    Map<String, String>? headers =
        auth ? {"Authorization": "Bearer ${Storage.to.apiToken}"} : null;

    if (data != null && data is Map<String, dynamic>) {
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
      if (method == 'post' || method == 'put') {
        data = FormData(data);
      }
    }

    final response = await request(url, method,
        query: method == 'get' ? data : null,
        body: ['post', 'put', 'patch'].contains(method) ? data : null,
        headers: headers,
        contentType: contentType,
        uploadProgress: uploadProgress);

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
