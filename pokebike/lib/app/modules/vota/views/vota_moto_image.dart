import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/vota/controllers/vota_controller.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class VotaMotoImage extends GetView<VotaController> {
  final double height;
  final String motoAvatar;
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
                  .withOpacity(0.4),
              blurRadius: 64,
              spreadRadius: 8,
              offset: Offset.zero,
              blurStyle: BlurStyle.normal),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Obx(() => AnimatedSwitcher(
            duration: const Duration(seconds: 3),
            child: controller.hasVoted.value
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${((reversed ? 1 - controller.percentage.value : controller.percentage.value) * 100).toPrecision(2)}%",
                      style: context.textTheme.displaySmall,
                    ),
                  )
                : MimageNetwork(
                    path: motoAvatar,
                    borderRadius: BorderRadius.circular(16),
                  ),
          )),
    );
  }
}
