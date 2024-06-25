import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

void handleApiResponse(
    BuildContext context, ApiResponse response, Function(dynamic) onSuccess,
    {Function(dynamic)? onError}) {
  if (response.success) {
    onSuccess(response.data);
  } else {
    if (onError != null) {
      onError(response.data);
    } else {
      context.scaffold.showSnackBar(SnackBar(
        content: Text(response.message),
        action: SnackBarAction(
          label: "Ok",
          onPressed: () => context.scaffold.clearSnackBars(),
        ),
      ));
    }
  }
}

Future<ApiResponse> handleApiEndpoint(Function method, String url,
    {dynamic data,
    bool auth = false,
    String contentType = 'application/json'}) async {
  try {
    Map<String, String>? headers =
        auth ? {"Authorization": "Bearer ${Storage.to.apiToken}"} : null;

    if (data != null && data is Map<String, dynamic>) {
      for (MapEntry el in data.entries) {
        if (el.value is XFile) {
          final fileBytes = await el.value.readAsBytes();
          final multipartFile = MultipartFile(fileBytes,
              filename: el.value.name, contentType: 'application/octet-stream');
          data[el.key] = multipartFile;
        }
      }
      data = FormData(data);
    }

    final response =
        await method(url, data, headers: headers, contentType: contentType);
    if (response.body == null) {
      return ApiResponse.error(
        status: response.status.code,
        message: "No data",
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

    if (body.containsKey("success") && body["success"]) {
      return ApiResponse.success(
          status: response.status.code,
          message: body["message"],
          data: body["data"]);
    } else {
      return ApiResponse.error(
          status: response.status.code,
          message: body["message"],
          data: body["data"]);
    }
  } catch (e) {
    e.printError();
    return ApiResponse.error(
      status: 500,
      message: e.toString(),
      data: null,
    );
  }
}
