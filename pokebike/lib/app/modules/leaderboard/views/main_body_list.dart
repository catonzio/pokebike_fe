import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/leaderboard/views/grid_view_selection.dart';
import 'package:pokebike/app/shared/widgets/classifica_profile_row.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/leaderboard_controller.dart';

class MainBodyList extends GetView<LeaderboardController> {
  const MainBodyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GridViewSelection(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Skeletonizer(
                  enabled: controller.isFetchingLeaderboard,
                  child: ListView(
                    itemExtent: context.height * 0.1,
                    padding: const EdgeInsets.only(bottom: 24),
                    children: (controller.isFetchingLeaderboard
                            ? controller.fakeLeaderboard
                            : controller.leaderboard)
                        .indexed
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: ClassificaProfileRow(
                                index: e.$1 + 1,
                                partecipazione: e.$2,
                              ),
                            ))
                        .toList(),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
