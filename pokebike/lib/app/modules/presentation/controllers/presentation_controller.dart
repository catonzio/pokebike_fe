import 'package:get/get.dart';
import 'package:pokebike/app/config/texts.dart';

class PresentationController extends GetxController {
  final RxInt _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final List<String> imagesPaths = [
    "assets/images/presentation_1.png",
    "assets/images/presentation_2.png",
    "assets/images/presentation_3.png",
  ];

  final List<String> titles = [
    Texts.presentation1Title,
    Texts.presentation2Title,
    Texts.presentation3Title,
  ];

  final List<String> subtitles = [
    Texts.presentation1Subtitle1,
    Texts.presentation2Subtitle1,
    Texts.presentation3Subtitle1,
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
