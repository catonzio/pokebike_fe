import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class CommunityTile extends StatelessWidget {
  final int index;
  final String text;
  final String imagePath;
  final String profileImagePath;
  final Function() onTap;

  const CommunityTile(
      {super.key,
      required this.index,
      required this.text,
      required this.imagePath,
      required this.profileImagePath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: MimageNetwork(
              borderRadius: BorderRadius.circular(16),
              path: imagePath,
              cacheHeight: 350,
              cacheWidth: 450,
            ),
          ),
          Positioned(
            bottom: 0,
            height: context.height * 0.07,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: CommunityTileBottomRow(
                    index: index,
                    text: text,
                    imagePath: profileImagePath,
                  )),
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
          color: MColors.primary.withOpacity(0.5),
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
            height: context.width * 0.05,
            width: context.width * 0.05,
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
                style: context.textTheme.bodySmall,
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
