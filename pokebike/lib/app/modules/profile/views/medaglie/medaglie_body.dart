import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/modules/profile/controllers/profile_controller.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/coccarde_wrap_widget.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/divider_title.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/medaglie_row_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moto_hunters/generated/l10n.dart';

class MedaglieBody extends GetView<ProfileController> {
  const MedaglieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: Get.context!.width,
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator.adaptive(
            onRefresh: controller.fetchCoccarde,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  bottom: Constants.bottomNavbarHeight * 2 / 3),
              children: [
                DividerTitle(S.of(context).medals.toUpperCase()),
                Skeletonizer(
                    enabled: controller.isLoadingNumCatture.value,
                    child: Obx(() => MedaglieRowWidget(
                          numCatture: controller
                                  .user.value?.profile?.numMotoCatturate ??
                              0,
                        ))),
                DividerTitle(S.of(context).cockades.toUpperCase()),
                Skeletonizer(
                    enabled: controller.isLoadingCoccarde.value,
                    child: const CoccardeGridWidget())
              ],
            ),
          ),
        ));
  }
}
