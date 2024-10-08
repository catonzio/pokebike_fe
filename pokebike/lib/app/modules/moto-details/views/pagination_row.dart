import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

import '../controllers/moto_details_controller.dart';

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
                  'info'.tr,
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: controller.isShowingInfo.value
                          ? MColors.secondaryDark
                          : Colors.white),
                )),
            TextButton(
                onPressed: () => controller.toggleShowingInfo(value: false),
                child: Text(
                  'state'.tr,
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: controller.isShowingInfo.value
                          ? Colors.white
                          : MColors.secondaryDark),
                ))
          ],
        ));
  }
}
