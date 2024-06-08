import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';

class StoryWidget extends StatelessWidget {
  final String? text;
  final double radius;
  final String imagePath;
  final Function()? onTap;

  const StoryWidget(
      {super.key,
      this.radius = 150,
      required this.imagePath,
      this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            // borderRadius: BorderRadius.circular(100),
            splashColor: Colors.red,
            hoverColor: Colors.blue,
            focusColor: Colors.green,
            highlightColor: Colors.yellow,
            customBorder: const CircleBorder(),
            child: Container(
              padding: const EdgeInsets.all(4),
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
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Colors.black,
                foregroundImage: Image.network(
                  imagePath,
                ).image,
              ),
            ),
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
}
