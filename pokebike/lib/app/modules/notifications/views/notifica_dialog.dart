import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/notifica/notifica.dart';
import 'package:moto_hunters/app/shared/extensions/date_utils.dart';
import 'package:moto_hunters/generated/l10n.dart';

class NotificaDialog extends StatelessWidget {
  const NotificaDialog({
    super.key,
    required this.notifica,
  });

  final Notifica notifica;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
            width: Get.context!.width * 0.5,
            height: Get.context!.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    notifica.data.title,
                    style: Get.context!.textTheme.headlineLarge,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Text(notifica.data.body,
                        style: Get.context!.textTheme.bodyLarge),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      notifica.readAt != null
                          ? Text(
                              S.of(context).read(
                                notifica.readAt!.toFormattedString(withHour: true),
                              ),
                              style: Get.context!.textTheme.labelSmall,
                            )
                          : const SizedBox.shrink(),
                      // Spacer(),
                      Text(
                        S.of(context).received(
                          notifica.createdAt.toFormattedString(withHour: true),
                        ),
                        style: Get.context!.textTheme.labelSmall,
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
