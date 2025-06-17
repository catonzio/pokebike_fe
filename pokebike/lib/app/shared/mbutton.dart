import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';

class MButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color? textColor;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final Function() onTap;

  const MButton(
      {super.key,
      required this.label,
      this.color = MColors.secondaryDark,
      this.textColor,
      this.border,
      this.width = double.infinity,
      this.height,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Get.context!.textTheme.bodyMedium!;
    if (textColor != null) {
      textStyle = textStyle.copyWith(color: textColor);
    }

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(32),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            border: border,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
