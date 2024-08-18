import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_page.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/partecipa_torneo_grid.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';

class PartecipaTorneoView extends GetView<PartecipaTorneoController> {
  const PartecipaTorneoView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.isMotoChosen.value
        ? MotoDetailPage(index: controller.motoIndex.value)
        : DefaultPage(
            backButton: true,
            title: "Scegli la tua moto",
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // ShimmerTitle.light(text: "Scegli la tua moto"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SearchRow(
                      onSearchField: _onSearchField,
                      onSave: _onSave,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RefreshIndicator(
                          child: const PartecipaTorneoGrid(),
                          onRefresh: () async => controller.onRefresh()),
                    ),
                  )
                ],
              ),
            ));
  }

  void _onSearchField(String value) {}

  void _onSave(Map<String, List<String>> options) {}
}
