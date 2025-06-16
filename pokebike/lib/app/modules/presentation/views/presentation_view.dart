import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/presentation/views/presentation_container.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/back_button.dart';
import 'package:moto_hunters/app/shared/widgets/utils/dynamic_image.dart';

import '../controllers/presentation_controller.dart';
import 'circle_page_indicator.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
              "assets/images/presentation/presentation_bg.png",
              width: Get.context!.width,
              height: Get.context!.height,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Obx(() => PresentationContainer(
                  height: Get.context!.height * 0.855,
                  onNext: () => _onNext(context),
                  image: controller.image.value,
                  title: controller.title.value,
                  subtitle: controller.subtitle.value,
                )),
            Positioned(
              bottom: Get.context!.height * 0.05,
              height: Get.context!.height * 0.04,
              left: Get.context!.width * 0.35,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...controller.imagesPaths.indexed.map(
                      ((int, DynamicImage) e) => Obx(() => CirclePageIndicator(
                            selected: e.$1 == controller.index,
                            width: Get.context!.width * 0.02,
                          ))),
                  SizedBox(width: Get.context!.width * 0.3),
                  InkWell(
                    child: Text(S.of(context).jump),
                    onTap: () => _skipPresentation(context),
                  )
                ],
              ),
            )
          ],
        ));
  }

  _skipPresentation(BuildContext context) {
    Storage.to.hasSeenPresentation = true;
    Get.context!.navigator.popAndPushNamed(Routes.LOGIN_REGISTER);
  }

  _onNext(BuildContext context) {
    if (controller.index < 2) {
      controller.next();
    } else {
      _skipPresentation(context);
    }
  }
}
