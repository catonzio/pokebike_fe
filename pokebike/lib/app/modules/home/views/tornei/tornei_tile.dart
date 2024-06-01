import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class TorneiTile extends StatelessWidget {
  final int index;
  final String text;
  final Function() onTap;

  const TorneiTile(
      {super.key, this.index = 0, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
                          "https://picsum.photos/200/200?random=$index")
                      .image,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      MColors.secondary.withOpacity(0.9), BlendMode.darken)),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(text, style: context.textTheme.bodyLarge!),
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
    );
  }
}
