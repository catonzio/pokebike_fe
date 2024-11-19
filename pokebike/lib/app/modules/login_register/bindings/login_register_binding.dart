import 'package:get/get.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

import '../controllers/login_register_controller.dart';

class LoginRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRegisterController>(
      () => LoginRegisterController(provider: Get.put(AuthProvider())),
    );
  }
}
