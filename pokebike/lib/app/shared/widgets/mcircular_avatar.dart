import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_hunters/app/config/colors.dart';

import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/utils/image_picker.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';
import 'package:moto_hunters/app/shared/widgets/photo_detail.dart';
import 'package:get/get.dart';

class MCircularAvatar extends StatelessWidget {
  final String? text;
  final double radius;
  final double padding;
  final ApiMedia? avatar;
  final XFile? file;
  final Function(XFile? file)? onModify;
  final Function()? onTap;
  final bool canReport;

  const MCircularAvatar(
      {super.key,
      this.radius = 150,
      this.padding = 4,
      this.avatar,
      this.file,
      this.text,
      this.onModify,
      this.onTap,
      this.canReport = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: (avatar != null && avatar!.url.isNotEmpty)
                ? avatar!.url
                : (file?.path ?? "placeholder"),
          child: Stack(
            children: [
              Material(
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () => _onTap(context),
                  customBorder: const CircleBorder(),
                  child: Container(
                      padding: EdgeInsets.all(padding),
                      width: radius * 2,
                      height: radius * 2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            MColors.primary,
                            MColors.secondary,
                          ],
                          stops: [0, 0.8],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: InteractiveViewer(
                        child: file != null
                            ? LocalImage(file: file)
                            : (avatar != null && avatar!.url.isNotEmpty)
                                ? CachedNetworkImage(
                                imageUrl: /* Constants.isLocal &&
                                        avatar!.url
                                            .startsWith('http://localhost:8080')
                                    ? avatar!.url.replaceFirst(
                                        'http://localhost:8080',
                                        Constants.baseUrl)
                                    : */
                                    avatar!.url,
                                width: 195,
                                height: 195,
                                maxWidthDiskCache: 195,
                                maxHeightDiskCache: 195,
                                imageBuilder: (context, imageProvider) {
                                  return CircleAvatar(
                                    radius: radius,
                                    backgroundColor: Colors.black,
                                    foregroundImage: imageProvider,
                                  );
                                },
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: MCircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                              )
                                : CircleAvatar(
                                    radius: radius,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.person, size: radius),
                                  ),
                      )),
                ),
              ),
              if (onModify != null)
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: Icon(
                      Icons.edit,
                      color: MColors.iconRed,
                    ))
            ],
          ),
        ),
        if (text != null)
          Text(
            text!,
            overflow: TextOverflow.ellipsis,
          )
      ],
    );
  }

  _onTap(BuildContext context) async {
    if (onTap != null) {
      onTap!();
    }
    if (onModify != null) {
      XFile? file = await selectAvatar(context);
      onModify?.call(file);
    } else if (avatar != null && avatar!.url.isNotEmpty) {
      Get.context!.navigator.push(
        MaterialPageRoute(
            builder: (context) => PhotoDetail(
                  tag: avatar!.url,
                  avatar: avatar!,
                  canReport: canReport,
                )),
      );
    }
  }
}

class LocalImage extends StatelessWidget {
  const LocalImage({
    super.key,
    required this.file,
  });

  final XFile? file;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Image.file(
      File(file!.path),
      fit: BoxFit.cover,
      cacheHeight: 215,
      cacheWidth: 215,
    ));
  }
}
