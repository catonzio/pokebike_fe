import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
// import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class BottomNavbarButton extends StatelessWidget {
  final int index;
  final RxInt currentIndex;
  final String iconName;
  final String label;
  final String route;
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
      required this.route,
      required this.onTap,
      this.selectedColor = MColors.secondary,
      this.unselectedColor = Colors.grey,
      this.size});

  @override
  Widget build(BuildContext context) {
    bool isSelected = Get.currentRoute == route;
    final Color color = isSelected ? selectedColor : unselectedColor;
    final String addName = isSelected ? " red" : "";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MIcon(
          name: iconName + addName,
          onTap: () => onTap(index),
          // color: color,
          size: size,
        ),
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(color: color),
        )
      ],
    );
  }
}
