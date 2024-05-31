import 'package:get/get.dart';

import '../controllers/fotocamera_controller.dart';

class FotocameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FotocameraController>(
      () => FotocameraController(),
    );
  }
}
