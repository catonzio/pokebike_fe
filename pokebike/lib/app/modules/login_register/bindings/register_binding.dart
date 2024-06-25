import 'package:get/get.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    AuthProvider provider = Get.put<AuthProvider>(AuthProvider());
    Get.lazyPut<RegisterController>(() => RegisterController(provider: provider));
  }
}
