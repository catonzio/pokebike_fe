import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/empty_garage_body.dart';
import 'package:pokebike/app/modules/garage/views/garage_card_view.dart';
import 'package:pokebike/app/modules/moto-details/moto_details_arguments.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CollezioneWidget extends GetView<GarageController> {
  const CollezioneWidget({super.key});

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
    return SliverList(
        delegate: SliverChildListDelegate.fixed([
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SearchRow(onSearchField: _onSearchField, onSave: _onSave),
      ),
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
        itemBuilder: (BuildContext context, int index) {
          Moto? moto = elements[index];
          return GarageCardWidget(
              index: index + 1,
              moto: moto,
              onTap: () => _onTapElement(context, moto));
        },
        itemCount: elements.length,
      )
    ]));
  }

  void _onTapElement(BuildContext context, Moto? m) {
    final bool isGarage = controller.isShowingGarage.value;
    if (m != null) {
      context.navigator
          .pushNamed(Routes.MOTO_DETAILS,
              arguments: MotoDetailsArguments(moto: m, isOwnMoto: true))
          .then((value) => controller.isShowingGarage.value = isGarage);
    }
  }

  void _onSearchField(String value) {
    controller.filterGarages(value);
  }

  void _onSave(Map<String, List<String>> options) {
    controller.sortAndFilter(options);
  }
}
