import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/controllers/settings_controller.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => BottomNavbarController());
    Get.lazyPut(() => MDrawerController());
  }
}
