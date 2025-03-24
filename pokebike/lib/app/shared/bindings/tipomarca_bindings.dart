import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/controllers/tipo_marca_controller.dart';
import 'package:moto_hunters/app/shared/providers/tipo_marca_provider.dart';

class TipoMarcaBindings extends Bindings {
  @override
  void dependencies() {
    TipoMarcaProvider tipoMarcaProvider = Get.put(TipoMarcaProvider());
    Get.put(TipoMarcaController(provider: tipoMarcaProvider), permanent: true);
  }
}
