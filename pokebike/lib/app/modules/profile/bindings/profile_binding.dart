import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/bindings/garage_binding.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    GarageBinding().dependencies();
  }
}
