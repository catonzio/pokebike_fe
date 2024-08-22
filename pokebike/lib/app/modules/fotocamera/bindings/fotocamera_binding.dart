import 'package:get/get.dart';
import 'package:pokebike/app/modules/fotocamera/controllers/addmoto_form_controller.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';
import 'package:pokebike/app/shared/providers/tipo_marca_provider.dart';

import '../controllers/fotocamera_controller.dart';

class FotocameraBinding extends Bindings {
  @override
  void dependencies() {
    MotoProvider provider = Get.put<MotoProvider>(MotoProvider());
    TipoMarcaProvider tipoMarcaProvider =
        Get.put<TipoMarcaProvider>(TipoMarcaProvider());
    Get.lazyPut<FotocameraController>(() => FotocameraController(provider));
    Get.lazyPut<AddMotoFormController>(
        () => AddMotoFormController(provider: tipoMarcaProvider));
  }
}
