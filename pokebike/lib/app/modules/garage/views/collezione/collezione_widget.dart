import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/collezione/collezione_card_widget.dart';
import 'package:pokebike/app/modules/garage/views/empty_garage_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CollezioneWidget extends GetView<GarageController> {
  const CollezioneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isFetchingCollection,
        child: controller.isFetchingCollection
            ? _gridOfElements(mapListToWidget(controller.fakeCollections))
            : (controller.collections.isEmpty
                ? const EmptyGarageBody()
                : _gridOfElements(mapListToWidget(controller.collections)))));
  }

  List<Widget> mapListToWidget(List<int> list) {
    return list
        .map((index) => CollezioneCardWidget(
            index: index, onTap: () => print("Garage $index")))
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
