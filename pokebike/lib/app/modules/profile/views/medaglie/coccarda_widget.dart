import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moto_hunters/app/config/medals_cockades_enums.dart';
import 'package:moto_hunters/app/modules/profile/views/details/cockade_details.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/extensions/nums_utils.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';
import 'package:get/get.dart';

Cockades getCockade(int numCatturate) {
  if (numCatturate.inRange(
      lb: Cockades.none.lb, ub: Cockades.none.ub, lbe: true)) {
    return Cockades.none;
  } else if (numCatturate.inRange(
      lb: Cockades.bronzo.lb, ub: Cockades.bronzo.ub)) {
    return Cockades.bronzo;
  } else if (numCatturate.inRange(
      lb: Cockades.argento.lb, ub: Cockades.argento.ub)) {
    return Cockades.argento;
  } else if (numCatturate.inRange(lb: Cockades.oro.lb, ub: Cockades.oro.ub)) {
    return Cockades.oro;
  } else if (numCatturate.inRange(
      lb: Cockades.platino.lb, ub: Cockades.platino.ub)) {
    return Cockades.platino;
  } else {
    return Cockades.diamante;
  }
}

class CoccardaWidget extends StatelessWidget {
  final String text;
  final int numCatturate;
  const CoccardaWidget(this.text, this.numCatturate, {super.key});

  @override
  Widget build(BuildContext context) {
    Cockades cockade = getCockade(numCatturate);
    Cockades next = cockade.next;
    double percentage =
        cockade.ub == null ? 0 : max(0, numCatturate) / cockade.ub!;
    return GestureDetector(
      onTap: () => Get.context!.pushNamed(Routes.COCKADES_DETAILS,
          arguments: CockadesDetailsArguments(
              numCatturate: numCatturate, typeName: text)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: [
                Positioned.fill(
                    child: CircularProgressIndicator(
                  value: percentage,
                  valueColor: AlwaysStoppedAnimation<Color>(next.color),
                  backgroundColor: cockade.ub == null
                      ? Colors.transparent
                      : Cockades.none.color,
                )),
                Center(
                  child: MIcon(
                    name: "Cockade icon ${cockade.iconName}",
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          AutoSizeText(
            text,
            maxLines: 1,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
