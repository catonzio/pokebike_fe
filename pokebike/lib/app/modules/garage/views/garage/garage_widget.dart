import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/empty_garage_body.dart';
import 'package:pokebike/app/modules/garage/views/garage_card_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GarageWidget extends GetView<GarageController> {
  const GarageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverSkeletonizer(
        enabled: controller.isFetchingGarage,
        child: controller.isFetchingGarage
            ? _gridOfElements(controller.fakeGarages)
            : (controller.garages.isEmpty
                ? const EmptyGarageBody()
                : _gridOfElements(controller.garages))));
  }

  Widget _gridOfElements(List<Moto> elements) {
    return SliverGrid(
        gridDelegate: Constants.gridDelegate,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GarageCardWidget(
                moto: elements[index], onTap: () => print("Garage $index"));
          },
          childCount: elements.length,
        ));
  }
}
