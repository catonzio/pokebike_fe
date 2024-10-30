import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/models/notifica/notifica.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';

class NotificaCard extends StatelessWidget {
  const NotificaCard({
    super.key,
    required this.notifica,
  });

  final Notifica notifica;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: notifica.hasSeen ? MColors.primary : MColors.primaryLight,
      child: ListTile(
          title: AutoSizeText(
            notifica.data.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: AutoSizeText(notifica.data.body,
              maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: Text('received'
              .trParams({'when': notifica.createdAt.toFormattedString()}))),
    );
  }
}
