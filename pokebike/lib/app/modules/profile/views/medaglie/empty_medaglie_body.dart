import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/profile/controllers/profile_controller.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/divider_title.dart';
import 'package:moto_hunters/generated/l10n.dart';

class EmptyMedaglieBody extends GetView<ProfileController> {
  const EmptyMedaglieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: Get.context!.width,
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 0),
            children: [
              DividerTitle(S.of(context).medals.toUpperCase()),
              Text(
                S.of(context).noMedals,
                textAlign: TextAlign.center,
              ),
              DividerTitle(S.of(context).cockades.toUpperCase()),
              Text(
                S.of(context).noCockades,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
