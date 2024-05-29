import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MIcon extends StatelessWidget {
  final String name;
  final Color color;
  final double? size;

  const MIcon(
      {super.key,
      required this.name,
      this.color = Colors.white,
      this.size = 32});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/$name.svg",
      width: size,
      height: size,
      // colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
      // fit: BoxFit.fill,
    );
  }
}
