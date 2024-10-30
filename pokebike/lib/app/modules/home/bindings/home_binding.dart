import 'package:get/get.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.put(HomeController());
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
  }
}
