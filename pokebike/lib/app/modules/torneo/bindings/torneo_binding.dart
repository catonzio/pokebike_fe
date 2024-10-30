import 'package:get/get.dart';

import '../controllers/torneo_controller.dart';

class TorneoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TorneoController>(
      () => TorneoController(),
    );
  }
}
