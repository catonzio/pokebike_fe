import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/providers/auth_provider.dart';

import '../controllers/confirm_register_controller.dart';

class ConfirmRegisterBinding extends Bindings {
  @override
  void dependencies() {
    AuthProvider provider = Get.put<AuthProvider>(AuthProvider());
    Get.lazyPut<ConfirmRegisterController>(
      () => ConfirmRegisterController(provider: provider),
    );
  }
}
