import 'package:flutter/material.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

void handleApiResponse(
    BuildContext context, ApiResponse response, Function(dynamic) onSuccess) {
  if (response.success) {
    onSuccess(response.data);
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

Future<ApiResponse> handleApiEndpoint(Function method, String url,
    {dynamic data, bool auth = false}) async {
  try {
    Map<String, String>? headers =
        auth ? {"Authorization": "Bearer ${Storage.to.apiToken}"} : null;
    final response = await method(url, data, headers: headers);
    final Map<String, dynamic> body = response.body;

    if (response.status.code == 401 && body["message"] == "Unauthenticated.") {
      return ApiResponse.error(
        status: 401,
        message: "Unauthorized",
        data: null,
      );
    }

    if (body["success"]) {
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
  } on Exception catch (e) {
    return ApiResponse.error(
      status: 500,
      message: e.toString(),
      data: null,
    );
  }
}
