import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';

import '../controllers/leaderboard_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class UpperRow extends GetView<LeaderboardController> {
  const UpperRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MButton(
              width: Get.context!.width * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              backgroundColor: controller.isShowingWinner
                  ? MColors.primaryLight
                  : MColors.secondary,
              withBorders: false,
              onPressed: controller.showLeaderboard,
              child: AutoSizeText(
                S.of(context).generalLeaderboard,
                maxLines: 1,
              ),
            ),
            MButton(
              width: Get.context!.width * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              backgroundColor: controller.isShowingWinner
                  ? MColors.secondary
                  : MColors.primaryLight,
              withBorders: false,
              onPressed: controller.showWinner,
              child: Text(S.of(context).winner),
            )
          ],
        ));
  }
}
