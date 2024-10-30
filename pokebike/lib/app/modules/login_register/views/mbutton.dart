import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';

class MButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Color backgroundColor;
  final bool withBorders;
  final EdgeInsets padding;
  final double? height;
  final double? width;

  const MButton({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.child,
    this.height,
    this.width,
    this.withBorders = true,
    EdgeInsets? padding, // Ensure padding is properly handled as nullable
  }) : padding = padding ??
            const EdgeInsets.all(16); // Assign padding in initializer

  factory MButton.red({
    required Function() onPressed,
    required Widget child,
    EdgeInsets? padding,
    double? height,
    double? width,
  }) {
    return MButton(
      onPressed: onPressed,
      backgroundColor:
          MColors.secondaryDark, // Assuming MColors.secondaryDark is defined
      padding: padding,
      height: height,
      width: width,
      child: child,
    );
  }

  factory MButton.white(
      {required Function() onPressed,
      required Widget child,
      double? height,
      double? width}) {
    return MButton(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      height: height,
      width: width,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(64),
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.maxFinite,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(64),
          border: withBorders
              ? Border.all(color: MColors.secondaryDark, width: 2)
              : null,
        ),
        child: child,
      ),
    );
  }
}
