import 'package:get/get.dart';
import 'package:pokebike/app/modules/fotocamera/controllers/addmoto_form_controller.dart';
import 'package:pokebike/app/modules/fotocamera/providers/moto_provider.dart';

import '../controllers/fotocamera_controller.dart';

class FotocameraBinding extends Bindings {
  @override
  void dependencies() {
    MotoProvider provider = Get.put<MotoProvider>(MotoProvider());
    Get.lazyPut<FotocameraController>(() => FotocameraController(provider));
    Get.lazyPut<AddMotoFormController>(() => AddMotoFormController());
  }
}
