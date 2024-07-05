import 'package:get/get.dart';
import 'package:pokebike/app/modules/community/providers/community_provider.dart';

import '../controllers/community_controller.dart';

class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    CommunityProvider provider =
        Get.put<CommunityProvider>(CommunityProvider());
    Get.lazyPut<CommunityController>(
      () => CommunityController(provider),
    );
  }
}
