import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 10);
  }

  Future<ApiResponse> login(String email, String password) async {
    return handleApiEndpoint(request, "post", "/login",
        data: {
          'email': email,
          'password': password,
        },
        auth: false);
  }

  Future<ApiResponse> register(String email, String nome, String cognome,
      String username, String password, String birthdate, XFile avatar) async {
    ApiResponse response = await handleApiEndpoint(request, "post", "/register",
        data: {
          'name': nome,
          'surname': cognome,
          'username': username,
          'email': email,
          'password': password,
          'birthdate': birthdate,
          'avatar': avatar
        },
        contentType: 'multipart/form-data',
        auth: false);
    return response;
  }

  Future<ApiResponse> logout() async {
    return handleApiEndpoint(request, "post", "/logout");
  }

  Future<ApiResponse> checkToken() async {
    return handleApiEndpoint(request, "post", "/check-token");
  }

  Future<ApiResponse> setDeviceToken(String deviceToken) {
    return handleApiEndpoint(request, "post", "/users/device-token",
        data: {'device_token': deviceToken});
  }

  Future<ApiResponse> askVerificationCode() async {
    return handleApiEndpoint(request, "get", "/send-email-verification");
  }

  Future<ApiResponse> verifyCode(String code) async {
    return handleApiEndpoint(request, "post", "/verify-email",
        data: {"code": code});
  }

  Future<ApiResponse> passwordForgot(String email) async {
    return handleApiEndpoint(request, "post", "/forgot-password?email=$email");
  }
}
