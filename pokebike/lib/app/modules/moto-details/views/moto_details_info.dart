import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';

import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/modules/moto-details/views/moto_details_info_row.dart';
import 'package:moto_hunters/app/shared/extensions/date_utils.dart';

class MotoDetailsInfo extends StatelessWidget {
  final Moto moto;
  const MotoDetailsInfo({super.key, required this.moto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MotoDetailsInfoRow(
            label: 'captureDate'.tr,
            value: moto.dataCattura.toFormattedString()),
        MotoDetailsInfoRow(label: 'brand'.tr, value: moto.marcaMoto.nome),
        MotoDetailsInfoRow(label: 'model'.tr, value: moto.nome),
        MotoDetailsInfoRow(label: 'type'.tr, value: moto.tipoMoto.nome),
        MotoDetailsInfoRow(label: 'year'.tr, value: moto.anno.toString()),
        MotoDetailsInfoRow(label: 'location'.tr, value: moto.luogo),
        MotoDetailsInfoRow(label: 'description'.tr, value: moto.descrizione),
      ],
    );
  }
}

class CollezioneMotoDetailsInfo extends StatelessWidget {
  final CollezioneMoto collezioneMoto;
  const CollezioneMotoDetailsInfo({super.key, required this.collezioneMoto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MotoDetailsInfoRow(
            label: 'brand'.tr, value: collezioneMoto.marcaMoto.nome),
        MotoDetailsInfoRow(label: 'model'.tr, value: collezioneMoto.modello),
        MotoDetailsInfoRow(
            label: 'type'.tr, value: collezioneMoto.tipoMoto.nome),
        MotoDetailsInfoRow(label: 'nation'.tr, value: collezioneMoto.nazione),
      ],
    );
  }
}
