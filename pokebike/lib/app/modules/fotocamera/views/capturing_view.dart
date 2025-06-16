import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/camera_button.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/camera_row_button.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';

import '../controllers/fotocamera_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class CapturingView extends GetView<FotocameraController> {
  const CapturingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imagePreview(context),
        _buttonsRow(context),
        _lowerButtons(context)
      ],
    );
  }

  Container _imagePreview(BuildContext context) {
    return Container(
        height: Get.context!.height * 0.6,
        width: Get.context!.width,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: Obx(() => controller.isInitialized
            ? (controller.cameraError && controller.cameraController == null)
                ? const Center(
                    child: Text("Nessuna camera trovata"),
                  )
                : CameraPreview(controller.cameraController!)
            : const MCircularProgressIndicator()));
  }

  Padding _lowerButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.context!.width * 0.41,
          ),
          CameraButton(
            onTap: () => controller.makePhoto(context),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SizedBox(
              width: Get.context!.width * 0.3,
              height: Get.context!.height * 0.04,
              child: Obx(() {
                final isGarage = controller.selectedIndex == 0;
                return CameraRowButton(
                  isSelected: false,
                  text: isGarage
                      ? S.of(context).gallery
                      : '🔒 ${S.of(context).gallery}',
                  onTap: () {
                    if (isGarage) {
                      controller.takePhotoFromGallery(context);
                    } else {
                      Get.snackbar(
                        '',
                        S.of(context).galleryLockedMessage,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Padding _buttonsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          {
            "index": 0,
            "label": S.of(context).myGarage.toUpperCase(),
          },
          {
            "index": 1,
            "label": S.of(context).collection.toUpperCase(),
          },
          // {
          //   "index": 2,
          //   "label": S.of(context).story.toUpperCase(),
          // },
        ]
            .map((Map<String, dynamic> e) => SizedBox(
                width: Get.context!.width * 0.3,
                height: Get.context!.height * 0.04,
                child: Obx(() => CameraRowButton(
                      isSelected: e["index"] == controller.selectedIndex,
                      text: e["label"],
                      onTap: () => controller.selectedIndex = e["index"],
                    ))))
            .toList(),
      ),
    );
  }
}
