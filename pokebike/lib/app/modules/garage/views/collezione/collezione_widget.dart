import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/empty_garage_body.dart';
import 'package:pokebike/app/modules/garage/views/garage_card_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CollezioneWidget extends GetView<GarageController> {
  final EdgeInsetsGeometry? gridPadding;
  final Function(Moto) onTapElement;
  const CollezioneWidget(
      {super.key, this.gridPadding, required this.onTapElement});

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

  List<Widget> mapListToWidget(List<Moto> list) {
    return list
        .map((moto) =>
            GarageCardWidget(moto: moto, onTap: () => onTapElement(moto)))
        .toList();
  }

  Widget _gridOfElements(List<Widget> elements, {EdgeInsetsGeometry? padding}) {
    return GridView(
      padding: padding ?? EdgeInsets.zero,
      gridDelegate: Constants.gridDelegate,
      children: elements,
    );
  }
}
