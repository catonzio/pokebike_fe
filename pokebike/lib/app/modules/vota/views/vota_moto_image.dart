import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/modules/vota/controllers/vota_controller.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';

class VotaMotoImage extends GetView<VotaController> {
  final double height;
  final ApiMedia? motoAvatar;
  final bool reversed;

  const VotaMotoImage(
      {super.key,
      required this.height,
      required this.motoAvatar,
      this.reversed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 4 / 3,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: (reversed
                      ? MColors.votaSecondPlayerColor
                      : MColors.votaFirstPlayerColor)
                  .withValues(alpha: 0.4),
              blurRadius: 64,
              spreadRadius: 8,
              offset: Offset.zero,
              blurStyle: BlurStyle.normal),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Obx(() => Stack(
            alignment: Alignment.center,
            children: [
              MimageNetwork(
                path: motoAvatar?.url ?? '',
                borderRadius: BorderRadius.circular(16),
                lightLevel: controller.hasVoted.value ? 0.4 : 1,
                cacheHeight: 106,
                cacheWidth: 106,
              ),
              AnimatedOpacity(
                opacity: controller.hasVoted.value ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Text(
                  "${((reversed ? 1 - controller.percentage.value : controller.percentage.value) * 100).toPrecision(2)}%",
                  style: Get.context!.textTheme.displaySmall,
                ),
              )
            ],
          )),
    );
  }
}
