import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/config/medals_cockades_enums.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class MedalsDetails extends StatelessWidget {
  const MedalsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final int numCatturate = Get.arguments as int;

    return DefaultPage(
      backButton: true,
      title: 'capturedMotos'.tr,
      body: ListView(
        itemExtent: context.height * 0.2,
        padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
        children: Medals.values
            .sublist(1)
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleMedagliaDetail(
                      medaglia: e, numCatturate: numCatturate),
                ))
            .toList(),
      ),
    );
  }
}

class SingleMedagliaDetail extends StatelessWidget {
  final Medals medaglia;
  final int numCatturate;

  const SingleMedagliaDetail(
      {super.key, required this.medaglia, required this.numCatturate});

  @override
  Widget build(BuildContext context) {
    int realNum = medaglia.ub == null
        ? numCatturate
        : min<int>(numCatturate, medaglia.ub!);
    final double medalSize = Size(context.width, context.height).shortestSide;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'percMotosCaptured'.trParams({
            'realNum': realNum.toString(),
            'limit': medaglia.ub == null ? "" : "/${medaglia.ub}"
          }),
          style: context.textTheme.titleMedium,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            MIcon(
              name:
                  "Medal icon ${numCatturate < (medaglia.ub ?? Medals.platino.ub!) ? 'none' : medaglia.iconName}"
                      .trim(),
              size: medalSize * 0.15,
            ),
            if (medaglia.ub != null)
              SizedBox(
                width: medalSize * 0.25,
                height: medalSize * 0.25,
                child: CircularProgressIndicator(
                  value: realNum / (medaglia.ub ?? 1),
                  backgroundColor: Medals.none.color,
                  valueColor: AlwaysStoppedAnimation<Color>(medaglia.color),
                  strokeWidth: 5,
                ),
              )
          ],
        )
      ],
    );
  }
}
