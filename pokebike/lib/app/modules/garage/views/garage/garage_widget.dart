import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/data/search_options.dart';
import 'package:moto_hunters/app/modules/garage/controllers/garage_w_controller.dart';
import 'package:moto_hunters/app/modules/garage/views/empty_garage_body.dart';
import 'package:moto_hunters/app/modules/garage/views/garage/garage_card_widget.dart';
import 'package:moto_hunters/app/modules/moto-details/moto_details_arguments.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/search_row/search_row.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moto_hunters/generated/l10n.dart';

class GarageWidget extends GetView<GarageWController> {
  const GarageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverSkeletonizer(
        enabled: controller.isFetching,
        child: controller.isFetching
            ? _gridOfElements(controller.fakeList)
            : (controller.list.isEmpty
                ? EmptyGarageBody(
                    onRefresh: controller.refreshList,
                  )
                : _gridOfElements(controller.filteredList))));
  }

  Widget _gridOfElements(List<Moto> elements) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SearchRow(
              onSearchField: _onSearchField,
              onSave: _onSave,
              focusNode: controller.focusNode),
        ),
        elements.isEmpty
            ? Center(child: Text(S.of(Get.context!).noMotoFoundFilter))
            : GridView.builder(
                gridDelegate: Constants.gridDelegate,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
                itemBuilder: (context, index) {
                  return GarageCardWidget(
                      index: index,
                      moto: elements[index],
                      onTap: () => _onTapElement(context, elements[index]));
                },
                itemCount: elements.length,
              )
      ]),
    );
  }

  void _onTapElement(BuildContext context, Moto? m) {
    controller.focusNode.unfocus();
    // final bool isGarage = controller.isShowingGarage.value;
    if (m != null) {
      Get.context!.pushNamed(Routes.MOTO_DETAILS,
          arguments: MotoDetailsArguments(
              moto: m, isOwnMoto: true, canSetFavourite: true));
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
