import 'package:flutter/material.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/medaglia_widget.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/extensions/nums_utils.dart';

String medagliaName(int numCatture) {
  if (numCatture.inRange(lb: 0, ub: 40)) {
    return "bronzo";
  }
  if (numCatture.inRange(lb: 40, ub: 120)) {
    return "argento";
  }
  if (numCatture.inRange(lb: 120, ub: 180)) {
    return "oro";
  }
  if (numCatture.inRange(lb: 180, ub: 250)) {
    return "platino";
  }
  if (numCatture.inRange(lb: 251)) {
    return "diamante";
  } else {
    return "";
  }
}

class MedaglieRowWidget extends StatelessWidget {
  final int numCatture;

  const MedaglieRowWidget({super.key, required this.numCatture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
      child: GestureDetector(
        onTap: () => context.navigator
            .pushNamed(Routes.MEDALS_DETAILS, arguments: numCatture),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MedagliaWidget(numCatture > 0 ? "bronzo" : "", "Bronzo"),
              MedagliaWidget(numCatture > 41 ? "argento" : "", "Argento"),
              MedagliaWidget(numCatture > 121 ? "oro" : "", "Oro"),
              MedagliaWidget(numCatture > 181 ? "platino" : "", "Platino"),
              MedagliaWidget(numCatture > 251 ? "diamante" : "", "Diamante"),
            ]),
      ),
    );
  }
}
