import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';

import '../controllers/moto_details_controller.dart';

class MotoDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final MotoProvider provider = Get.put(MotoProvider());
    Get.lazyPut<MotoDetailsController>(
      () => MotoDetailsController(provider: provider),
    );
  }
}
