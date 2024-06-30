import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return const DefaultPage(
      backButton: true,
      title: "Classifica",
      body: Center(
        child: Text(
          'LeaderboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
