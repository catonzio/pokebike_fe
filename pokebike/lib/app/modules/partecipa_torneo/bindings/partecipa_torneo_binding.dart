import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/scelta_moto_controller.dart';

import '../controllers/partecipa_torneo_controller.dart';

class PartecipaTorneoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartecipaTorneoController>(
      () => PartecipaTorneoController(),
    );
    Get.lazyPut<SceltaMotoController>(
      () => SceltaMotoController(),
    );
    Get.lazyPut<GarageController>(
      () => GarageController(),
    );
  }
}
