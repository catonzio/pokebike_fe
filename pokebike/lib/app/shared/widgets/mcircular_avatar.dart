import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/image_picker.dart';
import 'package:pokebike/app/shared/widgets/paginator_widget.dart';
import 'package:pokebike/app/shared/widgets/photo_detail.dart';

class MCircularAvatar extends StatelessWidget {
  final String? text;
  final double radius;
  final double padding;
  final String? imagePath;
  final XFile? file;
  final Function(XFile? file)? onModify;
  final Function()? onTap;

  const MCircularAvatar(
      {super.key,
      this.radius = 150,
      this.padding = 4,
      this.imagePath,
      this.file,
      this.text,
      this.onModify,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: imagePath ?? file?.path ?? "error",
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
                            : CachedNetworkImage(
                                imageUrl: imagePath!,
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
    } else {
      context.navigator.push(
        MaterialPageRoute(
            builder: (context) => PhotoDetail(
                  tag: imagePath ?? file?.path ?? "error",
                  avatarUrl: imagePath ?? file?.path ?? "error",
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
