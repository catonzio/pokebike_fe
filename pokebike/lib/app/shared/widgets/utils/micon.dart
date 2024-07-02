import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MIcon extends StatelessWidget {
  final String name;
  final Color color;
  final double? size;
  final Function()? onTap;

  const MIcon(
      {super.key,
      required this.name,
      this.color = Colors.white,
      this.onTap,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          "assets/icons/$name.svg",
          width: size,
          height: size,
          // colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}