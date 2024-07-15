import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
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
        child: GetX<LeaderboardController>(
          builder: (controller) {
            List<Partecipazione> list = controller.isFetchingLeaderboard
                ? controller.fakeLeaderboard
                : controller.leaderboard;

            return Skeletonizer(
              enabled: controller.isFetchingLeaderboard,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
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
                        ...list.indexed.where((e) => (e.$1 + 1) % 2 == 0).map(
                            (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElementCard(
                                    index: e.$1 + 1, element: e.$2)))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: list.indexed
                          .where((e) => (e.$1 + 1) % 2 != 0)
                          .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  ElementCard(index: e.$1 + 1, element: e.$2)))
                          .toList(),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
