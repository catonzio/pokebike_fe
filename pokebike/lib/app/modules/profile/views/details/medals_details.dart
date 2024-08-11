import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class Medaglia {
  final int? ub;
  final String iconName;
  final Color color;

  const Medaglia(
      {required this.ub, required this.iconName, required this.color});
}

class MedalsDetails extends StatelessWidget {
  const MedalsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final int numCatturate = Get.arguments as int;

    return DefaultPage(
      backButton: true,
      title: "Moto catturate",
      body: ListView(
        itemExtent: context.height * 0.2,
        padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
        children: [
          const Medaglia(ub: 40, iconName: "bronzo", color: Color(0xFFb27e68)),
          const Medaglia(
              ub: 120, iconName: "argento", color: Color(0xFFc0c0c0)),
          const Medaglia(ub: 180, iconName: "oro", color: Color(0xFFffd700)),
          const Medaglia(
              ub: 250, iconName: "platino", color: Color(0xFFe5e4e2)),
          const Medaglia(
              ub: null, iconName: "diamante", color: Color(0xFFb9f2ff))
        ]
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
  final Medaglia medaglia;
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
          "Moto catturate: $realNum${medaglia.ub == null ? "" : "/${medaglia.ub}"}",
          style: context.textTheme.titleMedium,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            MIcon(
              name:
                  "Medal icon ${numCatturate < (medaglia.ub ?? double.maxFinite) ? '' : medaglia.iconName}"
                      .trim(),
              size: medalSize * 0.15,
            ),
            if (medaglia.ub != null)
              SizedBox(
                width: medalSize * 0.25,
                height: medalSize * 0.25,
                child: CircularProgressIndicator(
                  value: realNum / (medaglia.ub ?? 1),
                  backgroundColor: const Color(0xFF434343),
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
