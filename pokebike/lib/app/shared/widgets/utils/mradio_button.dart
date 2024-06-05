import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokebike/app/config/colors.dart';

class MRadioButton<T> extends StatelessWidget {
  final T value;
  final bool isSelected;
  // final T groupValue;
  final Function(T) onChanged;
  final double size;

  const MRadioButton(
      {super.key,
      required this.value,
      required this.isSelected,
      // required this.groupValue,
      required this.onChanged,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    // final bool isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      customBorder: const CircleBorder(),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: size * 2 / 3,
                  height: size * 2 / 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MColors.secondary,
                  ),
                ),
              ).animate(target: isSelected ? 1 : 0).fade()
            : null,
      ),
    );
  }
}
