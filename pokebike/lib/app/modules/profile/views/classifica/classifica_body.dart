import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
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
                  child: ClassificaProfileRow(
                    partecipazione: Partecipazione.fake(1),
                  ),
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
                height: context.height * 0.03,
              );
            },
            itemCount: 3)

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Container(
        //       height: context.height * 0.11,
        //       padding: const EdgeInsets.all(8.0),
        //       child: ClassificaProfileRow(
        //         profileImagePath: MImageProvider.getImageUrl(),
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.all(8.0),
        //       child: const StatisticsRow(),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.all(8.0),
        //       child: const TopMoto(),
        //     )
        //   ],
        // )
        ));
  }
}
