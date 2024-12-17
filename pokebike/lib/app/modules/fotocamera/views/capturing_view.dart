import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/fotocamera/views/camera_button.dart';
import 'package:pokebike/app/modules/fotocamera/views/camera_row_button.dart';
import 'package:pokebike/app/shared/widgets/paginator_widget.dart';

import '../controllers/fotocamera_controller.dart';

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
        height: context.height * 0.6,
        width: context.width,
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
            width: context.width * 0.41,
          ),
          CameraButton(
            onTap: () => controller.makePhoto(context),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SizedBox(
              width: context.width * 0.3,
              height: context.height * 0.04,
              child: CameraRowButton(
                isSelected: false,
                text: 'gallery'.tr,
                onTap: () => controller.takePhotoFromGallery(context),
              ),
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
            "label": 'myGarage'.tr.toUpperCase(),
          },
          {
            "index": 1,
            "label": 'collection'.tr.toUpperCase(),
          },
          // {
          //   "index": 2,
          //   "label": 'story'.tr.toUpperCase(),
          // },
        ]
            .map((Map<String, dynamic> e) => SizedBox(
                width: context.width * 0.3,
                height: context.height * 0.04,
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
