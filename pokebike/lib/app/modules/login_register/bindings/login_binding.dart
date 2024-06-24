import 'package:get/get.dart';
import 'package:pokebike/app/modules/login_register/providers/login_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    LoginProvider provider = Get.put<LoginProvider>(LoginProvider());
    Get.lazyPut<LoginController>(() => LoginController(provider: provider));
  }
}
