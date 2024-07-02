import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';

import '../controllers/leaderboard_controller.dart';

class UpperRow extends GetView<LeaderboardController> {
  const UpperRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MButton(
              width: context.width * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              backgroundColor: controller.isShowingWinner
                  ? MColors.primaryLight
                  : MColors.secondary,
              withBorders: false,
              onPressed: controller.showLeaderboard,
              child: const Text("Classifica generale"),
            ),
            MButton(
              width: context.width * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              backgroundColor: controller.isShowingWinner
                  ? MColors.secondary
                  : MColors.primaryLight,
              withBorders: false,
              onPressed: controller.showWinner,
              child: const Text("Vincitore"),
            )
          ],
        ));
  }
}
