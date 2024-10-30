import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class MCheckbox extends StatelessWidget {
  final RxBool isChecked;
  final void Function(bool?) onChanged;

  const MCheckbox(
      {super.key, required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final double size =
        Size(context.width * 0.07, context.height * 0.07).shortestSide;

    return Obx(() => InkWell(
        onTap: () => onChanged(!isChecked.value),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          width: size,
          height: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 3),
              color: isChecked.value ? MColors.secondary : Colors.white),
          duration: const Duration(milliseconds: 200),
        )));
  }
}
