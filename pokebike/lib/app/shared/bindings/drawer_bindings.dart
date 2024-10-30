import 'package:get/get.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';

class DrawerBindings extends Bindings {
  @override
  void dependencies() {
    AuthProvider provider = Get.put(AuthProvider());
    Get.put(MDrawerController(logoutProvider: provider), permanent: true);
    Get.put(BottomNavbarController(), permanent: true);
  }
}
