import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';

class MButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Color backgroundColor;

  const MButton(
      {super.key,
      this.onPressed,
      required this.backgroundColor,
      required this.child});

  factory MButton.red({required Function() onPressed, required Widget child}) { 
    return MButton(onPressed: onPressed, backgroundColor: MColors.secondaryDark, child: child);
  }

  factory MButton.white({required Function() onPressed, required Widget child}) { 
    return MButton(onPressed: onPressed, backgroundColor:Colors.white, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(64),
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(64),
          border: Border.all(color: MColors.secondaryDark, width: 2),
        ),
        child: child,
      ),
    );
  }
}
