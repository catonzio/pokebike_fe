import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/notifica/notifica.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';

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
            width: context.width * 0.5,
            height: context.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    notifica.title,
                    style: context.textTheme.headlineLarge,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child:
                        Text(notifica.body, style: context.textTheme.bodyLarge),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      notifica.seenAt != null
                          ? Text(
                              "Letta ${notifica.seenAt!.toFormattedString(withHour: true)}",
                              style: context.textTheme.labelSmall,
                            )
                          : const SizedBox.shrink(),
                      // Spacer(),
                      Text(
                        "Ricevuta ${notifica.receivedAt.toFormattedString(withHour: true)}",
                        style: context.textTheme.labelSmall,
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
