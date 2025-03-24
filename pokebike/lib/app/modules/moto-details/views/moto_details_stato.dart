import 'package:flutter/material.dart';

import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/modules/profile/views/classifica/statistics_row.dart';

class MotoDetailsStato extends StatelessWidget {
  final Moto moto;
  const MotoDetailsStato({super.key, required this.moto});

  @override
  Widget build(BuildContext context) {
    return StatisticsRow(
      numeroVittorie: moto.numVittorie,
      numeroSconfitte: moto.numSconfitte,
      boxShadow: false,
    );
  }
}
