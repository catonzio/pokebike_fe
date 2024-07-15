import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/empty_garage_body.dart';
import 'package:pokebike/app/modules/garage/views/garage_card_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CollezioneWidget extends GetView<GarageController> {
  final EdgeInsetsGeometry? gridPadding;
  final Function(Moto?) onTapElement;

  const CollezioneWidget(
      {super.key, this.gridPadding, required this.onTapElement});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverSkeletonizer(
        enabled: controller.isFetchingCollection,
        child: controller.isFetchingCollection
            ? _gridOfElements(controller.fakeCollections)
            : (controller.collections.isEmpty
                ? const EmptyGarageBody()
                : _gridOfElements(controller.collections))));
  }

  Widget _gridOfElements(List<Moto?> elements) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            Moto? moto = elements[index];
            return GarageCardWidget(
                index: index + 1, moto: moto, onTap: () => onTapElement(moto));
          },
          childCount: elements.length,
        ));
  }
}
