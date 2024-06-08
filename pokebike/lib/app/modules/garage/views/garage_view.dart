import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/data/enums/garage_type.dart';
import 'package:pokebike/app/modules/garage/views/collezione/collezione_widget.dart';
import 'package:pokebike/app/modules/garage/views/garage/garage_widget.dart';
import 'package:pokebike/app/modules/garage/views/pagination/pagination_row.dart';
import 'package:pokebike/app/modules/garage/views/profile_widget.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/back_button.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';

import '../controllers/garage_controller.dart';

class GarageView extends GetView<GarageController> {
  const GarageView({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.isShowingGarage.value =
          (context.modalRoute?.settings.arguments ?? GarageType.garage) ==
              GarageType.garage;
    });
    // if (context.mounted) {
    //   controller.isShowingGarage.value =
    //       (context.modalRoute?.settings.arguments ?? GarageType.garage) ==
    //           GarageType.garage;
    // }

    return DefaultPage(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Positioned.fill(
              top: context.height * 0.04,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _mainBody(context),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: MBackButton(
                  onPressed: () => context.navigator.pop(),
                ))
          ],
        ),
      ),
    );
  }

  Column _mainBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileWidget(
          radius: context.height * 0.07,
          text: "Name of user",
          imagePath: MImageProvider.getImageUrl(),
        ),
        const PaginationRow(),
        const SearchRow(),
        SizedBox(
          height: context.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Obx(() => controller.isShowingGarage.value
                ? const GarageWidget()
                : RefreshIndicator(
                    onRefresh: controller.fetchCollection,
                    child: CollezioneWidget(
                        // gridPadding: const EdgeInsets.only(
                        //     bottom: Constants.bottomNavbarHeight),
                        onTapElement: (int i) {
                      print("Tapped $i");
                    }))),
          ),
        )
      ],
    );
  }
}
