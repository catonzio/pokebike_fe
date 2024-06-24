import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/controllers/settings_controller.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/providers/logout_provider.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Storage());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => BottomNavbarController());
    LogoutProvider logoutProvider = Get.put(LogoutProvider());
    Get.lazyPut(() => MDrawerController(logoutProvider: logoutProvider));
  }
}
