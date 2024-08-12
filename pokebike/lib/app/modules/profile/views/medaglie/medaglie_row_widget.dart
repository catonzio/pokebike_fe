import 'package:flutter/material.dart';
import 'package:pokebike/app/config/medals_cockades_enums.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/medaglia_widget.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/extensions/nums_utils.dart';

Medals medagliaName(int numCatture) {
  if (numCatture.inRange(lb: 0, ub: Medals.bronzo.ub)) {
    return Medals.bronzo;
  }
  if (numCatture.inRange(lb: Medals.bronzo.ub, ub: Medals.argento.ub)) {
    return Medals.argento;
  }
  if (numCatture.inRange(lb: Medals.argento.ub, ub: Medals.oro.ub)) {
    return Medals.oro;
  }
  if (numCatture.inRange(lb: Medals.oro.ub, ub: Medals.platino.ub)) {
    return Medals.platino;
  }
  if (numCatture.inRange(lb: Medals.platino.ub)) {
    return Medals.diamante;
  } else {
    return Medals.none;
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
              MedagliaWidget(
                  numCatture > Medals.none.ub! ? "bronzo" : "none", "Bronzo"),
              MedagliaWidget(
                  numCatture > Medals.bronzo.ub! ? "argento" : "none",
                  "Argento"),
              MedagliaWidget(
                  numCatture > Medals.argento.ub! ? "oro" : "none", "Oro"),
              MedagliaWidget(
                  numCatture > Medals.oro.ub! ? "platino" : "none", "Platino"),
              MedagliaWidget(
                  numCatture > Medals.platino.ub! ? "diamante" : "none",
                  "Diamante"),
            ]),
      ),
    );
  }
}
