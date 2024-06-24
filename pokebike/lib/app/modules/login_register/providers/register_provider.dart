import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class RegisterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<ApiResponse> login(String email, String password) async {
    return handleApiEndpoint(post, "/register", data: {
      'email': email,
      'password': password,
    });
  }
}
