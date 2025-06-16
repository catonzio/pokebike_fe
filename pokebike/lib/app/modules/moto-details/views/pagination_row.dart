import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';

import '../controllers/moto_details_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class PaginationRow extends GetView<MotoDetailsController> {
  const PaginationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () => controller.toggleShowingInfo(value: true),
                child: Text(
                  S.of(context).info,
                  style: Get.context!.textTheme.bodyMedium?.copyWith(
                      color: controller.isShowingInfo.value
                          ? MColors.secondaryDark
                          : Colors.white),
                )),
            TextButton(
                onPressed: () => controller.toggleShowingInfo(value: false),
                child: Text(
                  S.of(context).state,
                  style: Get.context!.textTheme.bodyMedium?.copyWith(
                      color: controller.isShowingInfo.value
                          ? Colors.white
                          : MColors.secondaryDark),
                ))
          ],
        ));
  }
}
