import 'package:flutter/material.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:get/get.dart';

class CirclePageIndicator extends StatelessWidget {
  final bool selected;
  final double width;

  const CirclePageIndicator(
      {super.key, required this.selected, required this.width});

  @override
  Widget build(BuildContext context) {
    final Color color = selected ? MColors.secondary : Colors.white;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
