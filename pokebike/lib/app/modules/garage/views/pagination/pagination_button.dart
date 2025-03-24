import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';

class PaginationButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final double height;
  final Function() onPressed;

  const PaginationButton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.height,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // borderRadius: BorderRadius.circular(32),
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? MColors.secondary : Colors.grey,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          text,
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
