import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/data/search_options.dart';
import 'package:moto_hunters/app/modules/garage/controllers/collezione_controller.dart';
import 'package:moto_hunters/app/modules/garage/views/collezione/collezione_card_widget.dart';
import 'package:moto_hunters/app/modules/moto-details/moto_details_arguments.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/search_row/search_row.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moto_hunters/generated/l10n.dart';

class CollezioneWidget extends GetView<CollezioneController> {
  const CollezioneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SliverSkeletonizer(
          enabled: controller.isFetching,
          child: controller.isFetching
              ? _gridOfElements(controller.fakeList)
              : _gridOfElements(controller.filteredList));
    });
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
          controller: controller.searchController,
        ),
      ),
      elements.isEmpty
          ? Center(child: Text(S.of(Get.context!).noMotoFoundFilter))
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
                // Calcoliamo l'indice originale rispetto alla lista completa per mantenere la numerazione costante
                final originalIndex = controller.list.indexOf(collezioneMoto) + 1;
                return CollezioneCardWidget(
                    index: originalIndex,
                    collezioneMoto: collezioneMoto,
                    onTap: () => _onTapElement(context, collezioneMoto, originalIndex));
              },
              itemCount: elements.length,
            )
    ]));
  }

  void _onTapElement(BuildContext context, CollezioneMoto collezioneMoto, int collectionIndex) {
    controller.focusNode.unfocus();
    // final bool isGarage = controller.isShowingGarage.value;
    // if (m != null) {
    Get.context!.pushNamed(Routes.MOTO_DETAILS,
        arguments: MotoDetailsArguments(
            moto: collezioneMoto.moto,
            collezioneMoto: collezioneMoto,
            collectionIndex: collectionIndex,
            isOwnMoto: true,
            canSetFavourite: false));
    // .then((value) => controller.isShowingGarage.value = isGarage);
    // }
  }

  void _onSearchField(String value) {
    controller.filter(searchS: value);
  }

  void _onSave(SearchOptions options) {
    controller.filter(options: options);
  }
}
