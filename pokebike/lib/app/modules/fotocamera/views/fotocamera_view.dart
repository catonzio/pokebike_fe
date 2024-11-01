import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_view.dart';
import 'package:pokebike/app/modules/fotocamera/views/capturing_view.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/fotocamera_controller.dart';

class FotocameraView extends GetView<FotocameraController> {
  const FotocameraView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultPage(
          useAppbar: false,
          backButton: true,
          bottomBar: !controller.isCapturing,
          body: controller.isCapturing
              ? const CapturingView()
              : const AddMotoView(),
        ));
    // return Scaffold(
    //     body: Stack(
    //   children: [
    //     Obx(() => controller.isCapturing
    //         ? const CapturingView()
    //         : const AddMotoView()),
    //     Positioned(
    //         child: MBackButton(
    //       onPressed: context.navigator.pop,
    //     )),
    //   ],
    // ));
  }
}
