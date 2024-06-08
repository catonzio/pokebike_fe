import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/profile/controllers/profile_controller.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/divider_title.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EmptyMedaglieBody extends GetView<ProfileController> {
  const EmptyMedaglieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: context.width,
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 0),
            children: const [
              DividerTitle("MEDAGLIE"),
              Text(
                "Non hai vinto ancora nessuna medaglia",
                textAlign: TextAlign.center,
              ),
              DividerTitle("COCCARDE"),
              Text(
                "Non hai vinto ancora nessuna coccarda",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
