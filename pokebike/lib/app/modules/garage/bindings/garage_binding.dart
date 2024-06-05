import 'package:get/get.dart';
import 'package:pokebike/app/shared/bindings/search_row_bindings.dart';

import '../controllers/garage_controller.dart';

class GarageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GarageController>(
      () => GarageController(),
    );
    SearchRowBindings().dependencies();
  }
}
