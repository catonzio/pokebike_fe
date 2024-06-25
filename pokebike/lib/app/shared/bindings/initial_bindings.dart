import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/controllers/settings_controller.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Storage());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => BottomNavbarController());
    AuthProvider provider = Get.put(AuthProvider());
    Get.lazyPut(() => MDrawerController(logoutProvider: provider));
  }
}
