import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/config/medals_cockades_enums.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';
import 'package:moto_hunters/generated/l10n.dart';

class CockadesDetailsArguments {
  final int numCatturate;
  final String typeName;

  const CockadesDetailsArguments(
      {required this.numCatturate, required this.typeName});
}

class CockadesDetails extends StatelessWidget {
  const CockadesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final CockadesDetailsArguments arguments =
        Get.arguments as CockadesDetailsArguments;

    return DefaultPage(
      backButton: true,
      title: arguments.typeName,
      body: ListView(
        itemExtent: Get.context!.height * 0.2,
        padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
        children: Cockades.values
            .sublist(1)
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleCockadeDetail(
                      cockade: e, numCatturate: arguments.numCatturate),
                ))
            .toList(),
      ),
    );
  }
}

class SingleCockadeDetail extends StatelessWidget {
  final Cockades cockade;
  final int numCatturate;

  const SingleCockadeDetail(
      {super.key, required this.cockade, required this.numCatturate});

  @override
  Widget build(BuildContext context) {
    int realNum =
        cockade.ub == null ? numCatturate : min<int>(numCatturate, cockade.ub!);
    final double medalSize = Size(Get.context!.width, Get.context!.height).shortestSide;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          S.of(context).percMotosCaptured(
            realNum.toString(),
            cockade.ub == null ? '' : "/${cockade.ub}"),
          style: Get.context!.textTheme.titleMedium,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            MIcon(
              name:
                  "Cockade icon ${numCatturate < cockade.lb ? 'none' : cockade.iconName}"
                      .trim(),
              size: medalSize * 0.15,
            ),
            if (cockade.ub != null)
              SizedBox(
                width: medalSize * 0.25,
                height: medalSize * 0.25,
                child: CircularProgressIndicator(
                  value: realNum / (cockade.ub ?? 1),
                  backgroundColor: Cockades.none.color,
                  valueColor: AlwaysStoppedAnimation<Color>(cockade.color),
                  strokeWidth: 5,
                ),
              )
          ],
        )
      ],
    );
  }
}
