import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/notifica/notifica.dart';
import 'package:moto_hunters/app/modules/notifications/controllers/notifications_controller.dart';
import 'package:moto_hunters/app/modules/notifications/views/notifica_card.dart';
import 'package:moto_hunters/app/modules/notifications/views/notifica_dialog.dart';

class NotificationTile extends GetView<NotificationsController> {
  final Notifica notifica;

  const NotificationTile({super.key, required this.notifica});

  @override
  Widget build(BuildContext context) {
    final double circleSize =
        Size(context.width * 0.02, context.height * 0.02).shortestSide;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Dismissible(
        key: Key(notifica.id.toString()),
        onDismissed: _onDismissed,
        background: Container(
          color: MColors.secondaryDark,
        ),
        child: GestureDetector(
          onTap: () => _onTap(context),
          child: Stack(
            children: [
              NotificaCard(notifica: notifica),
              if (!notifica.hasSeen)
                Positioned(
                    top: 13,
                    right: 13,
                    child: Container(
                      width: circleSize,
                      height: circleSize,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: MColors.secondary),
                    ))
            ],
          ),
        ),
      ),
    );
  }

  void _onDismissed(DismissDirection direction) {
    controller.delete(notifica.id);
  }

  _onTap(BuildContext context) {
    controller.tap(notifica.id);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return NotificaDialog(notifica: notifica);
        });
  }
}
