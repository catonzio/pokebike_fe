import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
// import 'package:pokebike/app/config/texts.dart';

class PresentationController extends GetxController {
  final RxInt _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final List<String> imagesPaths = [
    "${Constants.apiStorageUrl}/presentation/presentation_1.png",
    "${Constants.apiStorageUrl}/presentation/presentation_2.png",
    "${Constants.apiStorageUrl}/presentation/presentation_3.png",
  ];

  final List<String> titles = [
    // Texts.presentation1Title,
    // Texts.presentation2Title,
    // Texts.presentation3Title,
    'presentation1Title'.tr,
    'presentation2Title'.tr,
    'presentation3Title'.tr,
  ];

  final List<String> subtitles = [
    // Texts.presentation1Subtitle1,
    // Texts.presentation2Subtitle1,
    // Texts.presentation3Subtitle1,
    'presentation1Subtitle1'.tr,
    'presentation2Subtitle1'.tr,
    'presentation3Subtitle1'.tr,
  ];

  RxString get imagePath => imagesPaths[index].obs;
  RxString get title => titles[index].obs;
  RxString get subtitle => subtitles[index].obs;

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
