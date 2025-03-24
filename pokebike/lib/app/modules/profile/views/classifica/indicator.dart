import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';

class Indicator extends StatelessWidget {
  final double percentage;
  final bool boxShadow;

  const Indicator({super.key, required this.percentage, this.boxShadow = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(15, (i) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Transform(
            transform: Matrix4.rotationZ(0.3),
            child: Container(
              height: context.height * 0.033,
              width: context.width * 0.025,
              decoration: BoxDecoration(
                  color: i * (100 / 15) < (percentage * 100)
                      ? MColors.secondaryDark
                      : MColors.primary,
                  boxShadow: !boxShadow
                      ? null
                      : const [
                          BoxShadow(
                              color: MColors.secondary,
                              blurRadius: 64,
                              spreadRadius: -3,
                              offset: Offset(1, 1))
                        ],
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        );
      }),
    );
  }
}
