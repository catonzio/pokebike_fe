import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/partecipazione/partecipazione.dart';
import 'package:moto_hunters/app/modules/vota/controllers/vota_controller.dart';
import 'package:moto_hunters/app/modules/vota/views/vota_moto_image.dart';
import 'package:moto_hunters/app/modules/vota/views/vota_player_row.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';

class VotaRow extends GetView<VotaController> {
  final Partecipazione partecipazione;
  final bool reversed;

  const VotaRow(
      {super.key, required this.partecipazione, this.reversed = false});

  @override
  Widget build(BuildContext context) {
    final double totalHeight = context.height * 0.285;
    final double playerRowHeight = totalHeight * 0.15;
    final double motoImageHeight = totalHeight * 0.7;

    final VotaPlayerRow playerRow = VotaPlayerRow(
      height: playerRowHeight,
      playerName: partecipazione.fullName,
      playerAvatar: partecipazione.avatar,
      reversed: reversed,
    );

    return SizedBox(
        height: totalHeight,
        child: Column(
          children: [
            if (reversed) playerRow,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () async {
                  ApiResponse response =
                      await controller.vota(partecipazione.id);
                  if (context.mounted) {
                    handleApiResponse(context, response,
                        successMessage: 'pointGained'.tr);
                  }
                },
                child: VotaMotoImage(
                  height: motoImageHeight,
                  motoAvatar: partecipazione.motoAvatar,
                  reversed: reversed,
                ),
              ),
            ),
            if (!reversed) playerRow,
          ],
        ));
  }
}
