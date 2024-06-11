import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/scelta_moto_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_detail_page.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/partecipa_torneo_grid.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

class PartecipaTorneoView extends GetView<PartecipaTorneoController> {
  const PartecipaTorneoView({super.key});

  @override
  Widget build(BuildContext context) {
    final SceltaMotoController sceltaMotoController =
        Get.find<SceltaMotoController>();
    return sceltaMotoController.isMotoChosen.value
        ? MotoDetailPage(index: sceltaMotoController.motoIndex.value)
        : DefaultPage(
            body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ShimmerTitle.light(text: "Scegli la tua moto"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: SearchRow(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RefreshIndicator(
                        child: const PartecipaTorneoGrid(),
                        onRefresh: () async => controller.onRefresh),
                  ),
                )
              ],
            ),
          ));
  }
}
