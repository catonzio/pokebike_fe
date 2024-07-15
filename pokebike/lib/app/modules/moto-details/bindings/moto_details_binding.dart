import 'package:get/get.dart';

import '../controllers/moto_details_controller.dart';

class MotoDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MotoDetailsController>(
      () => MotoDetailsController(),
    );
  }
}
