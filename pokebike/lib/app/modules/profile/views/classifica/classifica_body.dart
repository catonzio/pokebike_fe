import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/models/profile/profile.dart';
import 'package:moto_hunters/app/modules/profile/controllers/profile_controller.dart';
import 'package:moto_hunters/app/shared/widgets/classifica_profile_row.dart';
import 'package:moto_hunters/app/modules/profile/views/classifica/statistics_row.dart';
import 'package:moto_hunters/app/modules/profile/views/classifica/top_moto.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moto_hunters/generated/l10n.dart';

class ClassificaBody extends GetView<ProfileController> {
  const ClassificaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isLoadingClassifica.value,
        child: RefreshIndicator.adaptive(
          onRefresh: controller.refreshInfo,
          child: ListView.separated(
              // physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                  0, 0, 0, Constants.bottomNavbarHeight),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: Get.context!.height * 0.13,
                    padding:
                        EdgeInsets.fromLTRB(8, Get.context!.height * 0.05, 8, 0),
                    child: Obx(() => Skeletonizer(
                          enabled: controller.isFetchingClassificaTile.value,
                          child: controller.classificaTile.value == null
                              ? Center(
                                  child: Text(S.of(context).errorLoadingPartecipation))
                              : ClassificaProfileRow(
                                  classificaTile:
                                      controller.classificaTile.value!,
                                  shouldNavigate: false,
                                ),
                        )),
                  );
                } else if (index == 1) {
                  Profile? profile = controller.user.value?.profile;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StatisticsRow(
                      numeroVittorie: profile?.numVittorie ?? 0,
                      numeroSconfitte: profile?.numSconfitte ?? 0,
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TopMoto(),
                  );
                }
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: Get.context!.height * 0.05,
                );
              },
              itemCount: 3),
        )));
  }
}
