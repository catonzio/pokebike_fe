import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/providers/auth_provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginRegisterController extends GetxController {
  final AuthProvider provider;

  LoginRegisterController({required this.provider});

  Future<ApiResponse> googleRegister() async {
    try {
      try {
        await GoogleSignIn().disconnect();
      } on Exception catch (_) {}

      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(forceCodeForRefreshToken: true).signIn();
      if (googleUser == null) {
        return ApiResponse.error(message: "Error", data: null);
      }

      ApiResponse response = await provider.googleLogin(googleUser);
      // Loggo il risultato per debugging
      log('googleLogin response -> success: \\${response.success} | status: \\${response.status} | message: \\${response.message} | data: \\${response.data}');
      return response;
    } on Exception catch (e) {
      // TODO
      log('googleLogin exception -> $e');
    }
    return ApiResponse.error(message: "Error", data: null);
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

      String base64EncodedString = credential.identityToken!.split('.')[1];

      // Calculate the number of padding characters needed
      int paddingNeeded = 4 - (base64EncodedString.length % 4);

      // Add padding characters to the Base64 string
      for (int i = 0; i < paddingNeeded; i++) {
        base64EncodedString += "=";
      }

      // Decode the Base64-encoded string
      List<int> decodedBytes = base64.decode(base64EncodedString);

      // Convert the decoded bytes to a string
      String decodedString = utf8.decode(decodedBytes);

      // Parse the JSON string into a Dart object
      Map<String, dynamic> decodedJson = json.decode(decodedString);

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
      return ApiResponse.error(message: "User closed poupup", data: null);
    }
  }
}
