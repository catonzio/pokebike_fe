import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/modules/notifications/views/notification_tile.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/default_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      bottomAppbarActions: [
        IconButton(
          onPressed: controller.readAll,
          icon: const Icon(Icons.check),
          color: Colors.white,
          iconSize: 24,
        ),
        IconButton(
          onPressed: () => _deleteAll(context),
          icon: const Icon(Icons.delete_forever),
          color: Colors.white,
          iconSize: 24,
        )
      ],
      title: 'notifications'.tr,
      backButton: true,
      body: Obx(() => controller.list.isNotEmpty || controller.isFetching
          ? Skeletonizer(
              enabled: controller.isFetching,
              child: RefreshIndicator.adaptive(
                  onRefresh: controller.refreshList,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(
                        8, 8, 8, Constants.bottomNavbarHeight),
                    children: (controller.isFetching
                            ? controller.fakeList
                            : controller.list)
                        .map((el) => NotificationTile(notifica: el))
                        .toList(),
                  )),
            )
          : const EmptyNotificheBody()),
    );
  }

  _deleteAll(BuildContext context) {
    if (controller.list.isEmpty) {
      return;
    }
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: DefaultDialog(
                title: 'deleteNotifications'.tr,
                message: 'deleteNotificationsSure'.tr,
                redTitle: 'delete'.tr,
                redAction: (context) async {
                  await controller.deleteAll();
                  if (context.mounted) {
                    context.navigator.pop();
                  }
                },
                whiteTitle: 'nullify'.tr,
                whiteAction: (context) => context.navigator.pop()),
          );
        });
  }
}

class EmptyNotificheBody extends StatelessWidget {
  const EmptyNotificheBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.2),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'noNewNotifications'.tr,
          style: context.textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
