import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/garage/controllers/collezione_controller.dart';
import 'package:moto_hunters/app/modules/garage/controllers/garage_w_controller.dart';
import 'package:moto_hunters/app/modules/profile/providers/profile_provider.dart';
import 'package:moto_hunters/app/shared/bindings/search_row_bindings.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';

import '../controllers/garage_controller.dart';

class GarageBinding extends Bindings {
  @override
  void dependencies() {
    MotoProvider provider = Get.put(MotoProvider());
    GarageWController garageWController =
        Get.put(GarageWController(provider: provider));
    CollezioneController collezioneController =
        Get.put(CollezioneController(provider: provider));

    Get.lazyPut(() => ProfileProvider());
    Get.lazyPut<GarageController>(() => GarageController(
        garageWController: garageWController,
        collezioneController: collezioneController));
    SearchRowBindings().dependencies();
  }
}
