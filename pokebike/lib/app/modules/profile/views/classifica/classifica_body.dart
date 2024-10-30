import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/profile/profile.dart';
import 'package:pokebike/app/modules/profile/controllers/profile_controller.dart';
import 'package:pokebike/app/shared/widgets/classifica_profile_row.dart';
import 'package:pokebike/app/modules/profile/views/classifica/statistics_row.dart';
import 'package:pokebike/app/modules/profile/views/classifica/top_moto.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ClassificaBody extends GetView<ProfileController> {
  const ClassificaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isLoadingClassifica.value,
        child: RefreshIndicator(
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
                    height: context.height * 0.13,
                    padding: EdgeInsets.fromLTRB(8, context.height * 0.05, 8, 0),
                    child: Obx(() => Skeletonizer(
                          enabled: controller.isFetchingClassificaTile.value,
                          child: controller.classificaTile.value == null
                              ? Center(
                                  child: Text('errorLoadingPartecipation'.tr))
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
                  height: context.height * 0.05,
                );
              },
              itemCount: 3),
        )));
  }
}
