import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<ApiResponse> googleLogin(GoogleSignInAccount googleUser) async {
    String? token = (await googleUser.authentication).accessToken;
    ApiResponse response = await handleApiEndpoint(
      request,
      "post",
      "/google/login",
      data: {
        'email': googleUser.email,
        'name_surname': googleUser.displayName,
        'avatarUrl': googleUser.photoUrl,
        'token': token
      },
      auth: false,
    );
    return response;
  }

  Future<ApiResponse> appleLogin(
      String email, String fullName, String token) async {
    // String? token = (await googleUser.authentication).accessToken;
    ApiResponse response = await handleApiEndpoint(
      request,
      "post",
      "/google/login",
      data: {'email': email, 'name_surname': fullName, 'token': token},
      auth: false,
    );
    return response;
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
      String username, String password, String birthdate, XFile? avatar) async {
    final Map<String, dynamic> data = {
          'name': nome,
          'surname': cognome,
          'username': username,
          'email': email,
          'password': password,
          'birthdate': birthdate,
        };
    String contentType = 'application/json';
    if (avatar != null) {
      data['avatar'] = avatar;
      contentType = 'multipart/form-data';
    }
    ApiResponse response = await handleApiEndpoint(request, "post", "/register",
        data: data,
        contentType: contentType,
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
