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
            children: [
              DividerTitle('medals'.tr.toUpperCase()),
              Text(
                'noMedals'.tr,
                textAlign: TextAlign.center,
              ),
              DividerTitle('cockades'.tr.toUpperCase()),
              Text(
                'noCockades'.tr,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
