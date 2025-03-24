import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/profile/controllers/profile_controller.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/coccarda_widget.dart';

class CoccardeGridWidget extends GetView<ProfileController> {
  const CoccardeGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
          child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 16),
              padding: EdgeInsets.zero,
              children: [
                for (var el in (controller.isLoadingCoccarde.value
                    ? controller.fakeCoccardeScore.entries
                    : controller.coccardeScore.entries))
                  CoccardaWidget(el.key, el.value)
              ])),
    );
  }
}
