import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/widgets/info_dialog.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';
import 'package:moto_hunters/app/shared/widgets/tornei_list.dart';

import '../controllers/torneo_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class TorneoView extends GetView<TorneoController> {
  const TorneoView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShimmerTitle.light(
                  text: S.of(context).tournament,
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () => showInfoDialog(
                    context,
                    S.of(context).tournamentInfoMessage,
                    //onNeverShowAgain: () => Storage.to.hasSeenTournamentInfo = true,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TorneiList(
              itemExtent: Get.context!.height * 0.134,
              scrollDirection: Axis.vertical,
              scroll: false,
            ),
          )
        ],
      ),
    ));
  }
}
