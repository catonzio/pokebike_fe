import 'package:flutter/material.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/shared/widgets/image_gallery.dart';
import 'package:moto_hunters/app/shared/widgets/photo_detail.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/photo_report_menu.dart';
import 'package:get/get.dart';

class MotoMainPhoto extends StatelessWidget {
  final CollezioneMoto collezioneMoto;

  const MotoMainPhoto({super.key, required this.collezioneMoto});

  @override
  Widget build(BuildContext context) {
    // Se la collezione ha una moto associata e ha delle foto
    List<ApiMedia> images = [];
    if (collezioneMoto.moto != null) {
      // Usa le foto della moto se disponibili, altrimenti usa l'avatar
      if (collezioneMoto.moto!.photos.isNotEmpty) {
        images = collezioneMoto.moto!.photos;
      } else if (collezioneMoto.moto!.avatar != null) {
        images = [collezioneMoto.moto!.avatar!];
      }
    }

    return Hero(
      tag: collezioneMoto.id,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (collezioneMoto.moto != null && images.isNotEmpty) {
                  Get.context!.navigator.push(
                    MaterialPageRoute(
                      builder: (context) => PhotoDetail(
                          tag: collezioneMoto.moto!.id.toString(),
                          avatar: images.first,
                          canReport: false),
                    ),
                  );
                }
              },
              child: ImageGallery(
                images: images,
                height: 250,
                aspectRatio: 16 / 9,
                canReport: false,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: PhotoReportMenu(
              media: images.isNotEmpty ? images.first : ApiMedia.empty(),
            ),
          ),
        ],
      ),
    );
  }
}
