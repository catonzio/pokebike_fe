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
    return handleApiEndpoint(post, "/login", data: {
      'email': email,
      'password': password,
    });
  }

  Future<ApiResponse> register(String email, String nome, String cognome,
      String username, String password, String birthdate, XFile avatar) async {
    return handleApiEndpoint(post, "/register",
        data: {
          'name': nome,
          'surname': cognome,
          'username': username,
          'email': email,
          'password': password,
          'birthdate': birthdate,
          'avatar': avatar
        },
        contentType: 'multipart/form-data');
  }

  Future<ApiResponse> logout() async {
    return handleApiEndpoint(post, "/logout", auth: true);
  }

  Future<ApiResponse> checkToken() async {
    return handleApiEndpoint(post, "/check-token", auth: true);
  }
}
