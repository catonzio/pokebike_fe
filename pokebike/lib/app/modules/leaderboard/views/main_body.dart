import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/modules/leaderboard/views/main_body_grid.dart';
import 'package:pokebike/app/modules/leaderboard/views/main_body_list.dart';

import '../controllers/leaderboard_controller.dart';

class MainBody extends GetView<LeaderboardController> {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.65,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Obx(
            () => Stack(
              children: [
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: controller.isLeaderboardList
                        ? RefreshIndicator(
                            onRefresh: controller.refreshLeaderboard,
                            child: const MainBodyList(),
                          )
                        : RefreshIndicator(
                            onRefresh: controller.refreshList,
                            child: const MainBodyGrid())),
                if (controller.isFetchingOthers)
                  const Positioned(
                      left: 0,
                      right: 0,
                      bottom: Constants.bottomNavbarHeight,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ))
              ],
            ),
          )),
    );
  }
}
