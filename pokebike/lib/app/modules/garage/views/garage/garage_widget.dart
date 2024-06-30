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
    return Obx(() => Skeletonizer(
        enabled: controller.isFetchingGarage,
        child: controller.isFetchingGarage
            ? _gridOfElements(mapListToWidget(controller.fakeGarages))
            : (controller.garages.isEmpty
                ? const EmptyGarageBody()
                : _gridOfElements(mapListToWidget(controller.garages)))));
  }

  List<Widget> mapListToWidget(List<Moto> list) {
    return list
        .map((moto) =>
            GarageCardWidget(moto: moto, onTap: () => print("Garage $moto")))
        .toList();
  }

  Widget _gridOfElements(List<Widget> elements) {
    return GridView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: Constants.gridDelegate,
      children: elements,
    );
  }
}
