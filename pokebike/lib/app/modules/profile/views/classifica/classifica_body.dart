import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: context.height * 0.11,
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => Skeletonizer(
                        enabled: controller.isFetchingPartecipazione.value,
                        child: controller.lastPartecipazione.value == null
                            ? const Center(
                                child:
                                    Text("Errore caricamento partecipazione"))
                            : ClassificaProfileRow(
                                partecipazione:
                                    controller.lastPartecipazione.value!),
                      )),
                );
              } else if (index == 1) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: StatisticsRow(),
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
                height: context.height * 0.02,
              );
            },
            itemCount: 3)));
  }
}
