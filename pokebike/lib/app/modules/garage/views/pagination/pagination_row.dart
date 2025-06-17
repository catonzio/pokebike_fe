import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/garage/controllers/garage_controller.dart';
import 'package:moto_hunters/app/modules/garage/views/pagination/pagination_button.dart';
import 'package:moto_hunters/generated/l10n.dart';
import 'package:moto_hunters/app/shared/widgets/info_dialog.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';

class PaginationRow extends GetView<GarageController> {
  const PaginationRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = Get.context!.height * 0.04;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: PaginationButton(
                    text: S.of(context).garage,
                    height: height,
                    isSelected: controller.isShowingGarage.value,
                    onPressed: () {
                      controller.toggleShowing(true);
                      if (!Storage.to.hasSeenGarageInfo) {
                        showInfoDialog(
                          context,
                          S.of(context).garageInfoMessage,
                          onNeverShowAgain: () => Storage.to.hasSeenGarageInfo = true,
                        );
                      }
                    },
                  ),
                ),
              )),
          Obx(() => Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: PaginationButton(
                    text: S.of(context).collection,
                    height: height,
                    isSelected: !(controller.isShowingGarage.value),
                    onPressed: () {
                      controller.toggleShowing(false);
                      if (!Storage.to.hasSeenCollectionInfo) {
                        showInfoDialog(
                          context,
                          S.of(context).collectionInfoMessage,
                          onNeverShowAgain: () => Storage.to.hasSeenCollectionInfo = true,
                        );
                      }
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
