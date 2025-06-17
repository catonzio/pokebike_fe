import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/modules/leaderboard/controllers/leaderboard_controller.dart';

import 'package:moto_hunters/app/shared/widgets/giant_title.dart';
import 'package:moto_hunters/app/shared/widgets/utils/loading_stack.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moto_hunters/generated/l10n.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LeaderboardController>(
      initState: (state) {
        state.controller?.fetchWinner();
      },
      builder: (controller) {
        return Skeletonizer(
          enabled: controller.isFetchingWinner,
          child: controller.winner.value == null
              // ? Container(
              //     height: Get.context!.height * 0.3,
              //     color: Colors.blue,
              //     alignment: Alignment.center,
              //     child: Text(
              //       S.of(context).noWinner,
              //       style: Get.context!.textTheme.displaySmall,
              //       textAlign: TextAlign.center,
              //     ))
              // : _getBody(controller.winner.value!)
              ? LoadingStack(
                  sigmaX: 8,
                  sigmaY: 8,
                  isLoading: (controller.winner.value == null).obs,
                  topper: Container(
                      height: Get.context!.height * 0.3,
                      alignment: Alignment.center,
                      child: Text(
                        S.of(context).noWinner,
                        style: Get.context!.textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      )),
                  child: SizedBox.shrink(), // _getBody(User.fake(1)),
                )
              : _getBody(controller.winner.value!),
        );
      },
    );
  }

  Widget _getBody(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(S.of(Get.context!).winnerIs),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: SizedBox(
                child: MimageNetwork(
                  path: user.avatar?.url ?? '',
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GiantTitle(title: fullName(user)),
        )
      ],
    );
  }
}
