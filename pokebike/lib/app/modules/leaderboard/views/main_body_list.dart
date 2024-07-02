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
          child: Obx(() => Skeletonizer(
                enabled: controller.leaderboard.isEmpty,
                child: ListView.builder(
                  itemExtent: context.height * 0.1,
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: controller.leaderboard.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ClassificaProfileRow(
                        partecipazione: controller.leaderboard[index],
                      ),
                    );
                  },
                ),
              )),
        )
      ],
    );
  }
}
