import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';
import 'package:moto_hunters/app/shared/widgets/photo_report_menu.dart';

class CommunityTile extends StatelessWidget {
  final int index;
  final String text;
  final ApiMedia? image;
  final ApiMedia? profileImage;
  final Function() onTap;

  const CommunityTile(
      {super.key,
      required this.index,
      required this.text,
      required this.image,
      required this.profileImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final url = image?.url ?? '';
    final realUrl = url.contains('localhost')
        ? url.replaceAll('localhost:8080', '10.0.2.2:8080')
        : url;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: realUrl.isNotEmpty
                ? MimageNetwork(
                    borderRadius: BorderRadius.circular(16),
                    path: realUrl,
                    cacheHeight: 350,
                    cacheWidth: 450,
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.image_not_supported,
                        color: Colors.grey),
                  ),
          ),
          Positioned(
            bottom: 0,
            height: Get.context!.height * 0.07,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: CommunityTileBottomRow(
                    index: index,
                    text: text,
                    imagePath: profileImage?.url ?? '',
                  )),
            ),
          ),
          if (image != null)
            Positioned(
              top: 8,
              right: 8,
              child: PhotoReportMenu(
                //photoId: index,
                media: image!,
              ),
            )
        ],
      ),
    );
  }
}

class CommunityTileBottomRow extends StatelessWidget {
  final int index;
  final String text;
  final String imagePath;

  const CommunityTileBottomRow({
    super.key,
    required this.index,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MColors.primary.withValues(alpha: 0.5),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.context!.width * 0.05,
            width: Get.context!.width * 0.05,
            child: MimageNetwork(
              borderRadius: BorderRadius.circular(50),
              path: imagePath,
              cacheHeight: 55,
              cacheWidth: 55,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AutoSizeText(
                text,
                style: Get.context!.textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios)
          // IconButton(
          //     padding: EdgeInsets.zero,
          //     onPressed: () => {},
          //     icon: )
        ],
      ),
    );
  }
}
