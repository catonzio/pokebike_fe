import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/bindings/settings_binding.dart';
import 'package:pokebike/app/shared/bindings/drawer_bindings.dart';
import 'package:pokebike/app/shared/bindings/tipomarca_bindings.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Storage());
    SettingsBinding().dependencies();
    TipoMarcaBindings().dependencies();
    DrawerBindings().dependencies();
  }
}
