import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/medals_cockades_enums.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/medaglia_widget.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/extensions/nums_utils.dart';

Medals medagliaName(int numCatture) {
  if (numCatture.inRange(lb: Medals.none.lb, ub: Medals.none.ub, lbe: true)) {
    return Medals.none;
  }
  if (numCatture.inRange(
      lb: Medals.bronzo.lb, ub: Medals.bronzo.ub, lbe: true, ube: false)) {
    return Medals.none;
  }
  if (numCatture.inRange(
      lb: Medals.argento.lb, ub: Medals.argento.ub, lbe: true, ube: false)) {
    return Medals.bronzo;
  }
  if (numCatture.inRange(
      lb: Medals.oro.lb, ub: Medals.oro.ub, lbe: true, ube: false)) {
    return Medals.argento;
  }
  if (numCatture.inRange(
      lb: Medals.platino.lb, ub: Medals.platino.ub, lbe: true, ube: false)) {
    return Medals.oro;
  }
  if (numCatture.inRange(
      lb: Medals.diamante.lb, ub: Medals.diamante.ub, lbe: true, ube: false)) {
    return Medals.platino;
  } else {
    return Medals.diamante;
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
        behavior: HitTestBehavior.opaque,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MedagliaWidget(
                  numCatture >= Medals.bronzo.ub! ? "bronzo" : "none",
                  'bronze'.tr),
              MedagliaWidget(
                  numCatture >= Medals.argento.ub! ? "argento" : "none",
                  'silver'.tr),
              MedagliaWidget(
                  numCatture >= Medals.oro.ub! ? "oro" : "none", 'gold'.tr),
              MedagliaWidget(
                  numCatture >= Medals.platino.ub! ? "platino" : "none",
                  'platinum'.tr),
              MedagliaWidget(
                  numCatture >= Medals.diamante.ub! ? "diamante" : "none",
                  'diamond'.tr),
            ]),
      ),
    );
  }
}
