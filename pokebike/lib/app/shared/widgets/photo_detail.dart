import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/back_button.dart';
// import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';
import 'package:moto_hunters/app/shared/widgets/photo_report_menu.dart';

class InteractiveController extends GetxController {
  final RxBool isZoomed = false.obs;

  final TransformationController transformationController =
      TransformationController();

  checkIfZoomed(ScaleEndDetails details) {
    isZoomed.value =
        (Matrix4.identity() - transformationController.value).infinityNorm() >
            0.000001;
  }

  void doubleTap(TapDownDetails details) {
    if (isZoomed.value) {
      transformationController.value = Matrix4.identity();
      isZoomed.value = false;
    } else {
      final position = details.localPosition;
      // For a 3x zoom
      transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // transformationController.value = transformationController.value
      //   ..scale(transformationController.value.getMaxScaleOnAxis() *
      //       1.1); // Matrix4.identity()..scale(2.0, 2.0, 1.0);
      isZoomed.value = true;
    }
  }
}

class PhotoDetail extends StatelessWidget {
  final String tag;
  final ApiMedia? avatar;
  final bool canReport;

  const PhotoDetail(
      {super.key,
      required this.tag,
      required this.avatar,
      this.canReport = true});

  @override
  Widget build(BuildContext context) {
    final InteractiveController interactiveController =
        Get.put(InteractiveController());

    final Widget interaction = InteractiveViewer(
      transformationController: interactiveController.transformationController,
      onInteractionEnd: interactiveController.checkIfZoomed,
      child: MimageNetwork(
        fit: BoxFit.contain,
        path: avatar?.url ?? '',
      ),
    );

    return SafeArea(
      child: Hero(
        tag: tag,
        // child: interaction,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              // onVerticalDragEnd: (details) {
              //   if (!interactiveController.isZoomed.value &&
              //       details.primaryVelocity! != 0) {
              //     Get.context!.navigator.pop();
              //   }
              // },
              onDoubleTapDown: (details) =>
                  interactiveController.doubleTap(details),
              child: interaction,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Material(
                color: Colors.transparent,
                child: MBackButton(
                  onPressed: () => Get.context!.navigator.pop(),
                ),
              ),
            ),
            if (avatar != null && canReport)
              Positioned(
                top: 10,
                right: 10,
                child: PhotoReportMenu(
                  //photoId: int.parse(tag),
                  media: avatar!,
                ),
              )
          ],
        ),
      ),
    );
  }
}
