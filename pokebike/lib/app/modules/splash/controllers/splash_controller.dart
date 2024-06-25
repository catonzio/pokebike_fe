import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  final AuthProvider provider;

  SplashController({required this.provider});

  Future<bool> checkToken() async {
    ApiResponse response = await provider.checkToken();
    return response.success;
  }
}
