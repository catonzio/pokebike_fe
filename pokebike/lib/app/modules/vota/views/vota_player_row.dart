import 'package:flutter/material.dart';

import 'package:get/get.dart';

class VotaPlayerRow extends StatelessWidget {
  final double height;
  final bool reversed;
  final String playerName;
  final String playerAvatar;

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
      child: Text(playerName, style: context.textTheme.titleLarge),
    );

    return SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment:
              reversed ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (reversed) playerNameText,
            CircleAvatar(
              radius: height * 0.5,
              backgroundImage: NetworkImage(playerAvatar),
            ),
            if (!reversed) playerNameText
          ],
        ));
  }
}
