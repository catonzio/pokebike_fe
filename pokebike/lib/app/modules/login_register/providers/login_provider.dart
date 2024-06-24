import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<ApiResponse> login(String email, String password) async {
    return handleApiEndpoint(post, "/login", data: {
      'email': email,
      'password': password,
    });
    // try {
    //   final response = await post(
    //     '/login',
    //     {
    //       'email': email,
    //       'password': password,
    //     },
    //   );
    //   if (response.body["success"]) {
    //     return ApiResponse.success(
    //         status: response.status.code,
    //         message: response.body["message"],
    //         data: response.body["data"]);
    //   } else {
    //     return ApiResponse.error(
    //         status: response.status.code,
    //         message: response.body["message"],
    //         data: response.body["data"]);
    //   }
    // } on Exception catch (e) {
    //   return ApiResponse.error(
    //     status: 500,
    //     message: e.toString(),
    //     data: null,
    //   );
    // }
  }
}
