import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';

class CameraRowButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function() onTap;

  const CameraRowButton(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: MButton(
          backgroundColor:
              isSelected ? MColors.secondaryDark : MColors.primaryLight,
          padding: const EdgeInsets.all(0),
          withBorders: false,
          onPressed: onTap,
          child: AutoSizeText(
            text,
            maxLines: 1,
            style: context.theme.textTheme.labelLarge!
                .copyWith(color: isSelected ? Colors.white : Colors.grey),
          )),
    );
  }
}
