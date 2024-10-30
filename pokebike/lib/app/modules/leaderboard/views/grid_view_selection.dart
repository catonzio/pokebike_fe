import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

import '../controllers/leaderboard_controller.dart';

class GridViewSelection extends GetView<LeaderboardController> {
  const GridViewSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            IconButton(
              onPressed: () => controller.isLeaderboardList = true,
              icon: const Icon(Icons.list),
              color: controller.isLeaderboardList
                  ? MColors.secondary
                  : Colors.white,
            ),
            IconButton(
                onPressed: () => controller.isLeaderboardList = false,
                icon: const Icon(Icons.grid_view),
                color: controller.isLeaderboardList
                    ? Colors.white
                    : MColors.secondary),
          ],
        ));
  }
}
