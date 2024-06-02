import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/empty_garage_body.dart';
import 'package:pokebike/app/modules/garage/views/garage/garage_card_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GarageWidget extends GetView<GarageController> {
  const GarageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isFetchingGarage,
        child: controller.isFetchingGarage
            ? _gridOfElements(mapListToWidget(controller.fakeGarages))
            : (controller.garages.isEmpty
                ? const EmptyGarageBody()
                : _gridOfElements(mapListToWidget(controller.garages)))));
  }

  List<Widget> mapListToWidget(List<int> list) {
    return list
        .map((index) =>
            GarageCardWidget(index: index, onTap: () => print("Garage $index")))
        .toList();
  }

  Widget _gridOfElements(List<Widget> elements) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3),
      children: elements,
    );
  }
}
