import 'package:get/get.dart';
import 'package:pokebike/app/shared/bindings/search_row_bindings.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

import '../controllers/garage_controller.dart';

class GarageBinding extends Bindings {
  @override
  void dependencies() {
    MotoProvider provider = Get.put(MotoProvider());
    Get.lazyPut<GarageController>(
      () => GarageController(provider: provider)
    );
    SearchRowBindings().dependencies();
  }
}
