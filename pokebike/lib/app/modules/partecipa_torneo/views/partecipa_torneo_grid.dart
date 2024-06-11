import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/modules/garage/views/garage_card_view.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/empty_partecipa_torneo_grid.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_detail_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PartecipaTorneoGrid extends GetView<PartecipaTorneoController> {
  const PartecipaTorneoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Obx(() => Skeletonizer(
            enabled: controller.isFetching.value,
            child: controller.isFetching.value
                ? _gridOfElements(
                    mapListToWidget(context, controller.fakeCollections))
                : (controller.collections.isEmpty
                    ? const EmptyPartecipaTorneoGrid()
                    : _gridOfElements(
                        mapListToWidget(context, controller.collections),
                        padding: const EdgeInsets.only(
                            bottom: Constants.bottomNavbarHeight)))));
  }

  List<Widget> mapListToWidget(BuildContext context, List<int> list) {
    return list
        .map((index) => Hero(
              tag: index,
              child: Material(
                child: GarageCardWidget(
                    index: index,
                    onTap: () {
                      context.navigator.push(
                        MaterialPageRoute(
                            builder: (context) => MotoDetailPage(
                                  index: index,
                                )),
                      );
                    }),
              ),
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
      children: elements,
    );
  }
}
