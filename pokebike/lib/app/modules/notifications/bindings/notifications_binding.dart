import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/notifications/providers/notifica_provider.dart';

import '../controllers/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    NotificaProvider provider = Get.put(NotificaProvider());
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(provider: provider),
    );
  }
}
