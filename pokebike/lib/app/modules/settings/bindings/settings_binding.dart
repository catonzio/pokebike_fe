import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/providers/settings_provider.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    SettingsProvider provider = Get.put<SettingsProvider>(SettingsProvider());
    Get.lazyPut<SettingsController>(
      () => SettingsController(provider: provider),
    );
  }
}
