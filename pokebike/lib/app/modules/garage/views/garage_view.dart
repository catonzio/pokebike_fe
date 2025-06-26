import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/modules/garage/views/collezione/collezione_widget.dart';
import 'package:moto_hunters/app/modules/garage/views/garage/garage_widget.dart';
import 'package:moto_hunters/app/modules/garage/views/pagination/pagination_row.dart';
import 'package:moto_hunters/app/modules/garage/views/profile_widget.dart';
import 'package:moto_hunters/app/shared/controllers/api_pagination_controller.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/widgets/sliver_refresh.dart';
import 'package:moto_hunters/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moto_hunters/app/shared/widgets/info_dialog.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';

import '../controllers/garage_controller.dart';

class GarageView extends GetView<GarageController> {
  const GarageView({super.key});
  @override
  Widget build(BuildContext context) {
    // mostra dialog info Garage o Collezione al cambio se non già mostrato
    final ApiPaginationController apiController =
        (controller.isShowingGarage.value
            ? controller.garageWController
            : controller.collezioneController as ApiPaginationController);
    return Obx(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!controller.hasShownInitialInfo.value) {
          controller.hasShownInitialInfo.value = true;
          if (controller.isShowingGarage.value &&
              !Storage.to.hasSeenGarageInfo) {
            showInfoDialog(
              context,
              S.of(context).garageInfoMessage,
              onNeverShowAgain: () => Storage.to.hasSeenGarageInfo = true,
            );
          } else if (!controller.isShowingGarage.value &&
              !Storage.to.hasSeenCollectionInfo) {
            showInfoDialog(
              context,
              S.of(context).collectionInfoMessage,
              onNeverShowAgain: () => Storage.to.hasSeenCollectionInfo = true,
            );
          }
        }
      });
      return DefaultPage(
        backButton: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _mainBody(apiController, context),
        ),
        fabOnTap: apiController.showFAB
            ? () => apiController.scrollController.animateTo(0,
                duration: Duration(milliseconds: 500), curve: Curves.decelerate)
            : null,
      );
    });
  }

  Widget _mainBody(
      ApiPaginationController<dynamic> apiController, BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      controller: apiController.scrollController,
      // physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: Get.context!.height * 0.295,
          snap: false,
          pinned: false,
          floating: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Obx(() => Skeletonizer(
                      enabled: controller.user.value == null,
                      child: controller.user.value != null
                          ? ProfileWidget(
                              radius: Get.context!.height * 0.07,
                              text: fullName(controller.user.value!),
                              image: controller.user.value!.avatar,
                            )
                          : const SizedBox.shrink(),
                    )),
                const PaginationRow(),
              ],
            ),
          ),
        ),
        SliverRefresh(onRefresh: controller.refreshList),
        Obx(() => controller.isShowingGarage.value
            ? const GarageWidget()
            : const CollezioneWidget()),
      ],
    );
    // return Obx(() => Stack(
    //       children: [
    //         _buildScrollView(apiController, context),
    //         Positioned(
    //           top: 10,
    //           // bottom: 10,
    //           left: 100,
    //           right: 100,
    //           bottom: Constants.bottomNavbarHeight * 2,
    //           // right: 100,
    //           // height: Get.context!.height * 0.01,
    //           // width: Get.context!.width * 0.01,
    //           child: AnimatedSwitcher(
    //             duration: Duration(milliseconds: 300),
    //             child: apiController.showFAB
    //                 ? Container(
    //                     color: Colors.red,
    //                   )
    //                 : SizedBox.shrink(),
    //           ),
    //         )
    //       ],
    //     ));
  }
}
