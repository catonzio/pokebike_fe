import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/modules/leaderboard/views/grid_view_selection.dart';
import 'package:moto_hunters/app/shared/widgets/classifica_profile_row.dart';
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
                  enabled: controller.isFetching,
                  child: ListView(
                    controller: controller.scrollController,
                    itemExtent: Get.context!.height * 0.1,
                    // padding: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.only(
                        bottom: Constants.bottomNavbarHeight),
                    children: (controller.isFetching
                            ? controller.fakeLeaderboard
                            : controller.list)
                        .indexed
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: ClassificaProfileRow(
                                classificaTile: e.$2,
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
