import 'package:flutter/material.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/medaglia_widget.dart';

class MedaglieRowWidget extends StatelessWidget {
  const MedaglieRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MedagliaWidget("Bronzo"),
            MedagliaWidget("Argento"),
            MedagliaWidget("Oro"),
            MedagliaWidget("Platino"),
            MedagliaWidget("Diamante"),
          ]),
    );
  }
}
