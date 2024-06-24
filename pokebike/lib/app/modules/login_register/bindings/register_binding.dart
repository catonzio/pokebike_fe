import 'package:get/get.dart';
import 'package:pokebike/app/modules/login_register/providers/register_provider.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<RegisterProvider>(() => RegisterProvider());
  }
}
