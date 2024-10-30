import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/garage/views/garage/garage_card_widget.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/empty_partecipa_torneo_grid.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PartecipaTorneoGrid extends GetView<PartecipaTorneoController> {
  const PartecipaTorneoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isFetching,
        child: controller.isFetching
            ? _gridOfElements(mapListToWidget(context, controller.fakeList))
            : (controller.list.isEmpty
                ? const EmptyPartecipaTorneoGrid()
                : _gridOfElements(
                    mapListToWidget(context, controller.filteredList),
                    padding: const EdgeInsets.only(
                        bottom: Constants.bottomNavbarHeight)))));
  }

  List<Widget> mapListToWidget(BuildContext context, List<Moto> list) {
    return list.indexed
        .map(((int, Moto) indexMoto) => Hero(
              tag: indexMoto.$2.id,
              child: GarageCardWidget(
                  index: indexMoto.$1,
                  moto: indexMoto.$2,
                  onTap: () {
                    controller.focusNode.unfocus();
                    context.navigator.push(
                      MaterialPageRoute(
                          builder: (context) =>
                              MotoDetailPage(index: indexMoto.$1)),
                    );
                  }),
            ))
        .toList();
  }

  Widget _gridOfElements(List<Widget> elements, {EdgeInsetsGeometry? padding}) {
    return GridView(
      padding: padding ?? EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: elements,
    );
  }
}
