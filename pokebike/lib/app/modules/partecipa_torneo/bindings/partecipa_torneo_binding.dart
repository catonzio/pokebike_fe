import 'package:get/get.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

import '../controllers/partecipa_torneo_controller.dart';

class PartecipaTorneoBinding extends Bindings {
  @override
  void dependencies() {
    MotoProvider provider = Get.put(MotoProvider());
    Get.lazyPut<PartecipaTorneoController>(
      () => PartecipaTorneoController(provider: provider),
    );
  }
}
