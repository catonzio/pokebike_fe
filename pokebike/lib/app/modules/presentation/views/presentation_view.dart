import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/presentation/views/presentation_container.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/widgets/back_button.dart';

import '../controllers/presentation_controller.dart';
import 'circle_page_indicator.dart';

class PresentationView extends GetView<PresentationController> {
  const PresentationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Obx(() =>
                MBackButton(onPressed: () => controller.previous())
                    .animate(target: controller.index == 0 ? 0 : 1)
                    .fade())),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/presentation_bg.png",
              width: context.width,
              height: context.height,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Obx(() => PresentationContainer(
                  height: context.height * 0.855,
                  onNext: () => _onNext(context),
                  imagePath: controller.imagePath.value,
                  title: controller.title.value,
                  subtitle: controller.subtitle.value,
                )),
            Positioned(
              bottom: context.height * 0.05,
              height: context.height * 0.04,
              left: context.width * 0.35,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...controller.imagesPaths.indexed
                      .map(((int, String) e) => Obx(() => CirclePageIndicator(
                            selected: e.$1 == controller.index,
                            width: context.width * 0.02,
                          ))),
                  SizedBox(width: context.width * 0.3),
                  InkWell(
                    child: const Text("Salta"),
                    onTap: () => _skipPresentation(context),
                  )
                ],
              ),
            )
          ],
        ));
  }

  _skipPresentation(BuildContext context) {
    Navigator.popAndPushNamed(context, Routes.LOGIN_REGISTER);
  }

  _onNext(BuildContext context) {
    if (controller.index < 2) {
      controller.next();
    } else {
      _skipPresentation(context);
    }
  }
}
