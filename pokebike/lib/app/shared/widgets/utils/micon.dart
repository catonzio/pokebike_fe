import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MIcon extends StatelessWidget {
  final String name;
  final Color color;
  final double? size;
  final Function()? onTap;
  final EdgeInsets padding;

  const MIcon(
      {super.key,
      required this.name,
      this.color = Colors.white,
      this.onTap,
      this.size = 20,
      this.padding = const EdgeInsets.all(8.0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          "assets/icons/$name.svg",
          width: size,
          height: size,
          alignment: Alignment.center,
          // fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
