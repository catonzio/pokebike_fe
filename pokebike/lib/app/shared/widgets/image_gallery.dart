import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/widgets/photo_report_menu.dart';

class ImageGallery extends StatelessWidget {
  final List<ApiMedia> images;
  final double height;
  final double aspectRatio;
  final bool canReport;

  const ImageGallery({
    Key? key,
    required this.images,
    this.height = 200,
    this.aspectRatio = 16 / 9,
    this.canReport = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.image_not_supported, color: Colors.grey),
        ),
      );
    }

    if (images.length == 1) {
      return Container(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: height,
                width: double.infinity,
                imageUrl: convertUrl(images.first.url),
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  width: double.infinity,
                  height: height,
                  color: Colors.grey[300],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Container(
                  width: double.infinity,
                  height: height,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            if (canReport && images.isNotEmpty)
              Positioned(
                bottom: 8,
                right: 8,
                child: PhotoReportMenu(
                  media: images.first,
                ),
              ),
          ],
        ),
      );
    }

    return Container(
      height: height,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: convertUrl(images[index].url),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height,
                    placeholder: (_, __) => Container(
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (_, __, ___) {
                      log('Error loading image ${images[index].url}');
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.error),
                      );
                    },
                  ),
                ),
                // Indicatore posizione
                if (images.length > 1)
                  Positioned(
                    bottom: 8,
                    //right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${index + 1}/${images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (canReport && images.isNotEmpty)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: PhotoReportMenu(
                      media: images[index],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String convertUrl(String url) {
    // Sostituisce localhost con l'IP corretto per l'emulatore Android
    if (url.contains('localhost')) {
      url = url.replaceAll('localhost:8080', '10.0.2.2:8080');
      //url = url.replaceAll('localhost', '10.0.2.2');
    }
    return url;
  }
}
