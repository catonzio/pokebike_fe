import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/leaderboard/views/main_body_grid.dart';
import 'package:moto_hunters/app/modules/leaderboard/views/main_body_list.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';

import '../controllers/leaderboard_controller.dart';

class MainBody extends GetView<LeaderboardController> {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.context!.height * 0.625,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Obx(
            () => PaginatorWidget(
                body: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: controller.isLeaderboardList
                        ? RefreshIndicator.adaptive(
                            onRefresh: controller.refreshList,
                            child: const MainBodyList(),
                          )
                        : RefreshIndicator.adaptive(
                            onRefresh: controller.refreshList,
                            child: const MainBodyGrid())),
                showIndicator: controller.isFetchingOthers),
          )),
    );
  }
}
