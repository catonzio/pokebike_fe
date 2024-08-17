import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/bindings/settings_binding.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Storage());
    Get.put(BottomNavbarController(), permanent: true);
    SettingsBinding().dependencies();
    AuthProvider provider = Get.put(AuthProvider());
    Get.lazyPut(() => MDrawerController(logoutProvider: provider), fenix: true);
  }
}
