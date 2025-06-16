import 'dart:developer';

import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/providers/ui_images_provider.dart';
import 'package:moto_hunters/app/shared/utils/ui_images.dart';

class UIImagesController extends GetxController {
  static UIImagesController get to => Get.find();
  final UIImagesProvider provider;
  final RxMap<UIImageKey, ApiMedia?> images = <UIImageKey, ApiMedia?>{}.obs;

  UIImagesController({required this.provider});

  @override
  void onInit() {
    super.onInit();
    loadAll();
  }

  Future<void> loadAll() async {
    final list = await provider.fetchUIImages();
    log('UIImagesController: ${list.length} images loaded : ${list.map((e) => '${e.key!}:${e.url}').join(', ')}');
    final temp = {for (var m in list) m.key!: m};
    for (var key in UIImageKey.values) {
      images[key] = temp[key.key];
    }
  }

  ApiMedia? image(UIImageKey key) => images[key];
}
