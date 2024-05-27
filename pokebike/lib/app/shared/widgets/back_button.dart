import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pokebike/app/config/colors.dart';

class MBackButton extends StatelessWidget {
  final Function() onPressed;

  const MBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
            width: context.width * 0.1,
            height: context.width * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
    );
  }
}
