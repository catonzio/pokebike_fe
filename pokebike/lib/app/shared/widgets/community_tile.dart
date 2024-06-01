import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class CommunityTile extends StatelessWidget {
  final int index;
  final String text;
  final Function() onTap;

  const CommunityTile(
      {super.key,
      required this.index,
      required this.text,
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
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://picsum.photos/200/300?random=$index"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0), BlendMode.darken),
                ),
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(16),
              ),
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
                  child: CommunityTileBottomRow(index: index)),
            ),
          )
        ],
      ),
    );
  }
}

class CommunityTileBottomRow extends StatelessWidget {
  const CommunityTileBottomRow({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MColors.primary.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: context.width * 0.04,
            foregroundImage:
                Image.network("https://picsum.photos/250/250?random=$index")
                    .image,
          ),
          const Text("Hello"),
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
    );
  }
}
