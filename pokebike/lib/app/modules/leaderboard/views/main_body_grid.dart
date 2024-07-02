import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/leaderboard/views/element_card.dart';
import 'package:pokebike/app/modules/leaderboard/views/grid_view_selection.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/leaderboard_controller.dart';

class MainBodyGrid extends GetView<LeaderboardController> {
  const MainBodyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Obx(() => Skeletonizer(
            enabled: controller.leaderboard.isEmpty,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 32.0),
                      child: GridViewSelection(),
                    ),
                    ...controller.leaderboard.where((e) => e.id % 2 == 0).map(
                        (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElementCard(element: e)))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.leaderboard
                      .where((e) => e.id % 2 != 0)
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElementCard(element: e),
                          ))
                      .toList(),
                )
              ],
            ),
          )),
    );
  }
}
