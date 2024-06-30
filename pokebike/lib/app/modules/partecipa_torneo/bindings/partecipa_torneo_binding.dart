import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';

import '../controllers/partecipa_torneo_controller.dart';

class PartecipaTorneoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartecipaTorneoController>(
      () => PartecipaTorneoController(),
    );
    Get.lazyPut<GarageController>(
      () => GarageController(),
    );
  }
}
