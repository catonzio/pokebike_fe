import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/search_options.dart';
import 'package:moto_hunters/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:moto_hunters/app/modules/partecipa_torneo/views/moto_details/moto_detail_page.dart';
import 'package:moto_hunters/app/modules/partecipa_torneo/views/partecipa_torneo_grid.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/widgets/search_row/search_row.dart';

class PartecipaTorneoView extends GetView<PartecipaTorneoController> {
  const PartecipaTorneoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isMotoChosen.value
        ? MotoDetailPage(index: controller.motoIndex.value)
        : DefaultPage(
            backButton: true,
            title: 'chooseMoto'.tr,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SearchRow(
                      onSearchField: _onSearchField,
                      onSave: _onSave,
                      focusNode: controller.focusNode,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RefreshIndicator.adaptive(
                          onRefresh: controller.refreshList,
                          child: const PartecipaTorneoGrid()),
                    ),
                  )
                ],
              ),
            )));
  }

  void _onSearchField(String value) {
    controller.filter(searchS: value);
  }

  void _onSave(SearchOptions options) {
    controller.filter(options: options);
  }
}
