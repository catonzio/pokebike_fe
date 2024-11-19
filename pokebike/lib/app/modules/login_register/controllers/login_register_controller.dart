import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

class LoginRegisterController extends GetxController {

  final AuthProvider provider;

  LoginRegisterController({required this.provider});


  Future<ApiResponse> googleRegister() async {
    try {
      try {
        await GoogleSignIn().disconnect();
      } on Exception catch (_) {}

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      print(googleAuth);

      ApiResponse response =
          await provider.googleLogin(googleUser!);
      return response;

    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
    return ApiResponse.error(message: "Error", data: null);
  }

  Future<bool> checkToken() async {
    ApiResponse result = await provider.checkToken();
    return result.success;
  }
}
