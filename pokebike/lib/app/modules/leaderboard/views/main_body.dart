import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/leaderboard/views/main_body_grid.dart';
import 'package:pokebike/app/modules/leaderboard/views/main_body_list.dart';

import '../controllers/leaderboard_controller.dart';

class MainBody extends GetView<LeaderboardController> {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.6,
      child: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.isLeaderboardList
                    ? const MainBodyList()
                    : const MainBodyGrid()),
          )),
    );
  }
}
