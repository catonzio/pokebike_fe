import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/vota/views/vota_moto_image.dart';
import 'package:pokebike/app/modules/vota/views/vota_player_row.dart';

class VotaRow extends StatelessWidget {
  final String playerName;
  final String playerAvatar;
  final String motoAvatar;
  final bool reversed;

  const VotaRow(
      {super.key,
      this.reversed = false,
      required this.playerName,
      required this.playerAvatar,
      required this.motoAvatar});

  @override
  Widget build(BuildContext context) {
    final double totalHeight = context.height * 0.3;
    final double playerRowHeight = totalHeight * 0.15;
    final double motoImageHeight = totalHeight * 0.7;

    final VotaPlayerRow playerRow = VotaPlayerRow(
      height: playerRowHeight,
      playerName: playerName,
      playerAvatar: playerAvatar,
      reversed: reversed,
    );

    return SizedBox(
        height: totalHeight,
        child: Column(
          children: [
            if (reversed) playerRow,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: VotaMotoImage(
                height: motoImageHeight,
                motoAvatar: motoAvatar,
                reversed: reversed,
              ),
            ),
            if (!reversed) playerRow,
          ],
        ));
  }
}
