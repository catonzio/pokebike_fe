import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/collezione/collezione_card_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CollezioneWidget extends GetView<GarageController> {
  const CollezioneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isFetchingGarage,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1),
          children: (controller.isFetchingCollection
                  ? controller.fakeCollections
                  : controller.collections)
              .map((index) => CollezioneCardWidget(
                  index: index, onTap: () => print("Collezione $index")))
              .toList(),
        )));
  }
}