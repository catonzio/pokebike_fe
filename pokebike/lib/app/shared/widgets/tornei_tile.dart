import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

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
                  image: Image.asset("assets/images/$imageName").image,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: MColors.secondaryDark.withOpacity(0.5),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(32.0),
                  child: Text(text, style: context.textTheme.bodyLarge!)),
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
