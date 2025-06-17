import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/utils/ui_images.dart';
import 'package:moto_hunters/app/shared/widgets/utils/dynamic_image.dart';
import 'package:moto_hunters/generated/l10n.dart';
// import 'package:moto_hunters/app/config/texts.dart';

class PresentationController extends GetxController {
  final RxInt _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final List<DynamicImage> imagesPaths = [
    DynamicImage(keyName: UIImageKey.presentation1),
    DynamicImage(keyName: UIImageKey.presentation2),
    DynamicImage(keyName: UIImageKey.presentation3),
  ];

  final List<String> titles = [
    // Texts.presentation1Title,
    // Texts.presentation2Title,
    // Texts.presentation3Title,
    S.of(Get.context!).presentation1Title,
    S.of(Get.context!).presentation2Title,
    S.of(Get.context!).presentation3Title,
  ];

  final List<String> subtitles = [
    // Texts.presentation1Subtitle1,
    // Texts.presentation2Subtitle1,
    // Texts.presentation3Subtitle1,
    S.of(Get.context!).presentation1Subtitle1,
    S.of(Get.context!).presentation2Subtitle1,
    S.of(Get.context!).presentation3Subtitle1,
  ];

  DynamicImage get image => imagesPaths[index];
  String get title => titles[index];
  String get subtitle => subtitles[index];

  next() {
    if (index < 2) {
      index++;
    }
  }

  previous() {
    if (index > 0) {
      index--;
    }
  }
}
