import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/modules/profile/controllers/profile_controller.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/coccarde_wrap_widget.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/divider_title.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/medaglie_row_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedaglieBody extends GetView<ProfileController> {
  const MedaglieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: context.width,
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: controller.fetchCoccarde,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  bottom: Constants.bottomNavbarHeight * 2 / 3),
              children: [
                const DividerTitle("MEDAGLIE"),
                Skeletonizer(
                    enabled: controller.isLoadingNumCatture.value,
                    child: Obx(() => MedaglieRowWidget(
                          numCatture: controller
                                  .user.value?.profile?.numMotoCatturate ??
                              0,
                        ))),
                const DividerTitle("COCCARDE"),
                Skeletonizer(
                    enabled: controller.isLoadingCoccarde.value,
                    child: const CoccardeGridWidget())
              ],
            ),
          ),
        ));
  }
}
