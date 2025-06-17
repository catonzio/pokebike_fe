import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';

class VotaPlayerRow extends StatelessWidget {
  final double height;
  final bool reversed;
  final String playerName;
  final ApiMedia? playerAvatar;

  const VotaPlayerRow(
      {super.key,
      required this.height,
      this.reversed = false,
      required this.playerName,
      required this.playerAvatar});

  @override
  Widget build(BuildContext context) {
    final Widget playerNameText = Padding(
      padding: EdgeInsets.only(
          left: reversed ? 0 : 16.0, right: reversed ? 16.0 : 0),
      child: Text(playerName, style: Get.context!.textTheme.titleLarge),
    );

    // Converti URL localhost per emulatore Android
    final avatarUrl = playerAvatar?.url ?? '';
    final convertedUrl = avatarUrl.contains('localhost')
        ? avatarUrl.replaceAll('localhost:8080', '10.0.2.2:8080')
        : avatarUrl;

    return SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment:
              reversed ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (reversed) playerNameText,
            CircleAvatar(
              radius: height * 0.5,
              backgroundImage: NetworkImage(convertedUrl),
            ),
            if (!reversed) playerNameText
          ],
        ));
  }
}
