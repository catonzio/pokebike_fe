import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/leaderboard/views/main_body.dart';
import 'package:pokebike/app/modules/leaderboard/views/upper_row.dart';
import 'package:pokebike/app/modules/leaderboard/views/winner_screen.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      backButton: true,
      title: "Classifica",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: UpperRow(),
          ),
          Obx(() => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.isShowingWinner
                    ? const WinnerScreen()
                    : const MainBody(),
              ))
        ],
      ),
    );
  }
}