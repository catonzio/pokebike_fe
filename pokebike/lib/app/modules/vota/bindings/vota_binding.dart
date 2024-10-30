import 'package:get/get.dart';
import 'package:pokebike/app/modules/vota/providers/vota_provider.dart';

import '../controllers/vota_controller.dart';

class VotaBinding extends Bindings {
  @override
  void dependencies() {
    final VotaProvider provider = Get.put<VotaProvider>(VotaProvider());
    Get.lazyPut<VotaController>(() => VotaController(provider: provider));
  }
}
