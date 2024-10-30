import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class CameraButton extends StatelessWidget {
  final Function() onTap;
  const CameraButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
          height: context.height * 0.09,
          width: context.height * 0.09,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(context.height * 0.01),
          alignment: Alignment.center,
          child: Container(
            decoration: const BoxDecoration(
              color: MColors.secondaryDark,
              shape: BoxShape.circle,
            ),
          )),
    );
  }
}
