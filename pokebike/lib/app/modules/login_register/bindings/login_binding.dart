import 'package:get/get.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    AuthProvider provider = Get.put<AuthProvider>(AuthProvider());
    Get.lazyPut<LoginController>(() => LoginController(provider: provider));
  }
}
