import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/profile/controllers/profile_controller.dart';
import 'package:pokebike/app/modules/profile/views/classifica/classifica_profile_row.dart';
import 'package:pokebike/app/modules/profile/views/classifica/statistics_row.dart';
import 'package:pokebike/app/modules/profile/views/classifica/top_moto.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ClassificaBody extends GetView<ProfileController> {
  const ClassificaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isLoadingClassifica.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: context.height * 0.11,
              padding: const EdgeInsets.all(8.0),
              child: const ClassificaProfileRow(),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const StatisticsRow(),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const TopMoto(),
            )
          ],
        )));
  }
}
