import 'package:get/get.dart';

import '../controllers/vota_controller.dart';

class VotaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VotaController>(
      () => VotaController(),
    );
  }
}
