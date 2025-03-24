import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/providers/auth_provider.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    AuthProvider provider = Get.put(AuthProvider());
    Get.lazyPut<SplashController>(
      () => SplashController(provider: provider),
    );
  }
}
