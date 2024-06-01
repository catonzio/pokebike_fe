
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/garage/garage_card_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GarageWidget extends GetView<GarageController> {
  const GarageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isFetchingGarage,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.3),
          children: (controller.isFetchingGarage
                  ? controller.fakeGarages
                  : controller.garages)
              .map((index) => GarageCardWidget(
                  index: index, onTap: () => print("Garage $index")))
              .toList(),
        )));
  }
}

