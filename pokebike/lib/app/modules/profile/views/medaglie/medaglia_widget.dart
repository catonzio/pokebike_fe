import 'package:flutter/material.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';
import 'package:get/get.dart';

class MedagliaWidget extends StatelessWidget {
  final String iconName;
  final String text;
  const MedagliaWidget(this.iconName, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MIcon(
          name: "Medal icon ${iconName.toLowerCase()}".trim(),
          size: 50,
        ),
        Text(text)
      ],
    );
  }
}
