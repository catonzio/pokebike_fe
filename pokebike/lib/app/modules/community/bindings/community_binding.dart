import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/community/providers/community_provider.dart';
import 'package:moto_hunters/app/shared/bindings/search_row_bindings.dart';

import '../controllers/community_controller.dart';

class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    CommunityProvider provider =
        Get.put<CommunityProvider>(CommunityProvider());
    Get.lazyPut<CommunityController>(() => CommunityController(provider));
    SearchRowBindings().dependencies();
  }
}
