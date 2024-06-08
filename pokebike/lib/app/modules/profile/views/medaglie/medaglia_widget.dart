import 'package:flutter/material.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class MedagliaWidget extends StatelessWidget {
  final String text;
  const MedagliaWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MIcon(
          name: "Medal icon ${text.toLowerCase()}",
          size: 50,
        ),
        Text(text)
      ],
    );
  }
}
