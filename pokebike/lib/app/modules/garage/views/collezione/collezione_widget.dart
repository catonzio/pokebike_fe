import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/search_options.dart';
import 'package:pokebike/app/modules/garage/controllers/collezione_controller.dart';
import 'package:pokebike/app/modules/garage/views/collezione/collezione_card_widget.dart';
import 'package:pokebike/app/modules/garage/views/empty_garage_body.dart';
import 'package:pokebike/app/modules/moto-details/moto_details_arguments.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CollezioneWidget extends GetView<CollezioneController> {
  const CollezioneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverSkeletonizer(
        enabled: controller.isFetching,
        child: controller.isFetching
            ? _gridOfElements(controller.fakeList)
            : (controller.list.isEmpty
                ? const EmptyGarageBody()
                : _gridOfElements(controller.filteredList))));
  }

  Widget _gridOfElements(List<CollezioneMoto> elements) {
    return SliverList(
        delegate: SliverChildListDelegate.fixed([
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SearchRow(
          onSearchField: _onSearchField,
          onSave: _onSave,
          focusNode: controller.focusNode,
        ),
      ),
      elements.isEmpty
          ? const Center(child: Text("Nessuna moto trovata con questi filtri"))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
              itemBuilder: (BuildContext context, int index) {
                CollezioneMoto collezioneMoto = elements[index];
                return CollezioneCardWidget(
                    index: index + 1,
                    collezioneMoto: collezioneMoto,
                    onTap: () => _onTapElement(context, collezioneMoto.moto));
              },
              itemCount: elements.length,
            )
    ]));
  }

  void _onTapElement(BuildContext context, Moto? m) {
    controller.focusNode.unfocus();
    // final bool isGarage = controller.isShowingGarage.value;
    if (m != null) {
      context.navigator.pushNamed(Routes.MOTO_DETAILS,
          arguments: MotoDetailsArguments(moto: m, isOwnMoto: true));
      // .then((value) => controller.isShowingGarage.value = isGarage);
    }
  }

  void _onSearchField(String value) {
    controller.filter(searchS: value);
  }

  void _onSave(SearchOptions options) {
    controller.filter(options: options);
  }
}
