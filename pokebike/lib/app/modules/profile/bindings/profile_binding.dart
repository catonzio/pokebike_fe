import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/profile/controllers/profile_controller.dart';
import 'package:moto_hunters/app/modules/profile/providers/profile_provider.dart';

// import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    ProfileProvider provider = Get.put(ProfileProvider());
    Get.lazyPut<ProfileController>(() => ProfileController(provider: provider));
  }
}
