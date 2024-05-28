import 'package:get/get.dart';

import '../controllers/confirm_register_controller.dart';

class ConfirmRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmRegisterController>(
      () => ConfirmRegisterController(),
    );
  }
}
