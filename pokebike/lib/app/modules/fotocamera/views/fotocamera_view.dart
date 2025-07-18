import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/add_moto_view.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/capturing_view.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/back_button.dart';

import '../controllers/fotocamera_controller.dart';

class FotocameraView extends GetView<FotocameraController> {
  const FotocameraView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultPage(
          showBanner: false,
          useAppbar: false,
          backButton: true,
          bottomBar: !controller.isCapturing,
          body: SafeArea(
            bottom: false,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                    child: controller.isCapturing
                        ? const CapturingView()
                        : const AddMotoView()),
                Positioned(
                    top: 0,
                    left: 0,
                    child: MBackButton(
                        onPressed: () => Get.context!.navigator.pop()))
              ],
            ),
          ),
        ));
    // return Scaffold(
    //     body: Stack(
    //   children: [
    //     Obx(() => controller.isCapturing
    //         ? const CapturingView()
    //         : const AddMotoView()),
    //     Positioned(
    //         child: MBackButton(
    //       onPressed: Get.context!.navigator.pop,
    //     )),
    //   ],
    // ));
  }
}
