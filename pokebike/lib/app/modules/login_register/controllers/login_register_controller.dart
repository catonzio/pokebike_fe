import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/providers/auth_provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginRegisterController extends GetxController {
  final AuthProvider provider;

  // Istanza condivisa di GoogleSignIn, in linea con le linee guida del plugin
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  LoginRegisterController({required this.provider}) {
    _googleSignIn.initialize(
      serverClientId: Constants.googleServerClientIdAndroid,
    );
  }

  Future<ApiResponse> googleRegister() async {
    try {
      // Provo a disconnettere eventuali sessioni precedenti
      try {
        await _googleSignIn.disconnect();
      } on Exception catch (_) {}

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      ApiResponse response = await provider.googleLogin(googleUser);
      // Loggo il risultato per debugging
      log('googleLogin response -> success: \\${response.success} | status: \\${response.status} | message: \\${response.message} | data: \\${response.data}');
      return response;
    } on GoogleSignInException catch (e) {
      log('googleLogin GoogleSignInException -> code: \\${e.code} | description: \\${e.description}');
      return ApiResponse.error(message: e.description ?? "Error", data: null);
    } on Exception catch (e) {
      log('googleLogin exception -> $e');
      return ApiResponse.error(message: "Error", data: null);
    }
  }

  Future<bool> checkToken() async {
    ApiResponse result = await provider.checkToken();
    return result.success;
  }

  Future<ApiResponse> loginWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'it.motohunters.console',
          redirectUri: Uri.parse(
            'https://console.motohunters.it/api/apple-redirect/apple-mobile',
          ),
        ),
      );

      if (credential.identityToken == null) {
        throw Exception('Apple Sign-In failed: No identity token received');
      }

      // Il token JWT di Apple è codificato in Base64URL; usiamo il decoder appropriato
      final String payloadBase64 = credential.identityToken!.split('.')[1];
      final String normalized = base64Url.normalize(payloadBase64);
      final Map<String, dynamic> decodedJson =
          json.decode(utf8.decode(base64Url.decode(normalized)))
              as Map<String, dynamic>;

      final userData = {
        'id': credential.authorizationCode,
        'token': credential.identityToken,
        'email': decodedJson["email"]
      };

      ApiResponse response =
          await provider.appleLogin(userData['email'], '', userData['token']);
      return response;
    } on Exception catch (e) {
      log("Apple Sign-In failed: $e");
      return ApiResponse.error(message: e.toString(), data: null);
    }
  }
}
