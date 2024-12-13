import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class SettingsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<ApiResponse> deleteUser(int userId) {
    return handleApiEndpoint(request, "delete", "/users/$userId");
  }

  Future<ApiResponse> updateUser(int id, Map<String, dynamic> params) {
    // WORKAROUND for PHP backend. No files with PUT/PATCH requests
    params['_method'] = 'PUT';
    return handleApiEndpoint(
      request,
      "post",
      "/users/$id",
      data: params,
      contentType: 'multipart/form-data',
    );
  }

  Future<ApiResponse> updatePassword(Map<String, dynamic> params) {
    return handleApiEndpoint(request, "put", "/users/update-password",
        data: params);
  }

  Future<ApiResponse> setLanguage(String locale) async {
    return handleApiEndpoint(
        request, "get", "/users/set-language?language=$locale");
  }
}
