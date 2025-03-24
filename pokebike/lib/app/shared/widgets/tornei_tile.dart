import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';

class TorneiTile extends StatelessWidget {
  final int index;
  final String text;
  final String imageName;
  final Function() onTap;

  const TorneiTile(
      {super.key,
      this.index = 0,
      required this.text,
      required this.imageName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(
                    "assets/images/$imageName",
                    cacheWidth: 600,
                    cacheHeight: 400,
                  ).image,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withValues(alpha: 0.3), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: MColors.secondaryDark.withValues(alpha: 0.5),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16.0),
                  child: AutoSizeText(
                    text,
                    style: context.textTheme.bodyLarge!,
                    maxLines: 1,
                  )),
            ),
          ),
          Positioned(
            width: context.width * 0.08,
            height: context.width * 0.08,
            right: 10,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                color: MColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: onTap,
                padding: const EdgeInsets.all(0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
