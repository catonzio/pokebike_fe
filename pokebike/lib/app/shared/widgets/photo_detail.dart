import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/back_button.dart';
// import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

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
  final String avatarUrl;

  const PhotoDetail({super.key, required this.tag, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final InteractiveController interactiveController =
        Get.put(InteractiveController());

    final Widget interaction = InteractiveViewer(
      transformationController: interactiveController.transformationController,
      onInteractionEnd: interactiveController.checkIfZoomed,
      child: MimageNetwork(
        fit: BoxFit.contain,
        path: avatarUrl,
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
              //     context.navigator.pop();
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
                  onPressed: () => context.navigator.pop(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
