import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/leaderboard/controllers/leaderboard_controller.dart';

import 'package:pokebike/app/shared/widgets/giant_title.dart';
import 'package:pokebike/app/shared/widgets/utils/loading_stack.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              ? LoadingStack(
                  sigmaX: 8,
                  sigmaY: 8,
                  isLoading: (controller.winner.value == null).obs,
                  topper: Center(
                      child: Text(
                    "Il vincitore non è ancora stato scelto",
                    style: context.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  )),
                  child: _getBody(User.fake(1)),
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
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Il vincitore è:"),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: SizedBox(
                child: MimageNetwork(
                  path: user.avatar,
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
