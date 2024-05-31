import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/micon.dart';

class BottomNavbarButton extends StatelessWidget {
  final int index;
  final RxInt currentIndex;
  final String iconName;
  final String label;
  final Color selectedColor;
  final Color unselectedColor;
  final Function(int) onTap;
  final double? size;

  const BottomNavbarButton(
      {super.key,
      required this.index,
      required this.currentIndex,
      required this.iconName,
      required this.label,
      required this.onTap,
      this.selectedColor = MColors.secondary,
      this.unselectedColor = Colors.grey,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Color color =
          currentIndex.value == index ? selectedColor : unselectedColor;
      final String addName = currentIndex.value == index ? " red" : "";
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => onTap(index),
            child: MIcon(
              name: iconName + addName,
              // color: color,
              size: size,
            ),
          ),
          Text(
            label,
            style: TextStyle(color: color),
          )
        ],
      );
    });
  }
}
