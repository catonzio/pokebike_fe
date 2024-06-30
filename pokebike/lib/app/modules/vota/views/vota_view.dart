import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/vota/views/vota_row.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';

import '../controllers/vota_controller.dart';

class VotaView extends GetView<VotaController> {
  const VotaView({super.key});

  @override
  Widget build(BuildContext context) {
    const String playerName1 = "Player 1";
    final String playerAvatar1 = MImageProvider.getImageUrl();
    final String motoAvatar1 = MImageProvider.getImageUrl();

    const String playerName2 = "Player 2";
    final String playerAvatar2 = MImageProvider.getImageUrl();
    final String motoAvatar2 = MImageProvider.getImageUrl();

    return DefaultPage(
        backButton: true,
        title: "Vota",
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              VotaRow(
                playerName: playerName1,
                playerAvatar: playerAvatar1,
                motoAvatar: motoAvatar1,
              ),
              Text(
                "VS",
                style: context.textTheme.displaySmall?.copyWith(
                  color: Colors.white.withOpacity(0.3),
                  fontWeight: FontWeight.normal,
                ),
              ),
              VotaRow(
                playerName: playerName2,
                playerAvatar: playerAvatar2,
                motoAvatar: motoAvatar2,
                reversed: true,
              )
            ],
          ),
        ));
  }
}
