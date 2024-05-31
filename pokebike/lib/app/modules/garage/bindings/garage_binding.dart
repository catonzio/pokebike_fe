import 'package:get/get.dart';

import '../controllers/garage_controller.dart';

class GarageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GarageController>(
      () => GarageController(),
    );
  }
}
