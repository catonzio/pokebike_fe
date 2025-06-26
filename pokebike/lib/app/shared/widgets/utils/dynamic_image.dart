import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/shared/utils/ui_images.dart';
import 'package:moto_hunters/app/shared/controllers/ui_images_controller.dart';

class DynamicImage extends StatelessWidget {
  final UIImageKey keyName;
  final BoxFit fit;
  const DynamicImage({
    Key? key,
    required this.keyName,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('[DYNAMIC IMAGE] ${keyName.name} url is ${UIImagesController.to.image(keyName)?.url} CHOOSING: ${UIImagesController.to.image(keyName) != null && UIImagesController.to.image(keyName)!.url.isNotEmpty ? 'ONLINE' : 'LOCAL'}');
    return Obx(() {
      final media = UIImagesController.to.image(keyName);
      if (media != null && media.url.isNotEmpty) {
        return CachedNetworkImage(
          imageUrl: '${Constants.baseUrl}${media.url}',
          placeholder: (_, __) => Container(color: Colors.black),
          fadeInDuration: const Duration(milliseconds: 120),
          fadeOutDuration: const Duration(milliseconds: 80),
          fit: fit,
        );
      }
      return Image.asset(keyName.fallbackAsset, fit: fit);
    });
  }
}
