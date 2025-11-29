import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';

import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/modules/moto-details/controllers/moto_details_controller.dart';
import 'package:moto_hunters/app/modules/moto-details/views/moto_details_info_row.dart';
import 'package:moto_hunters/app/shared/extensions/date_utils.dart';
import 'package:moto_hunters/generated/l10n.dart';

class MotoDetailsInfo extends StatelessWidget {
  final Moto moto;
  const MotoDetailsInfo({super.key, required this.moto});

  @override
  Widget build(BuildContext context) {
    final MotoDetailsController controller = Get.find<MotoDetailsController>();
    final bool unlocked = controller.hasUnlockedSpecsForMoto(moto);
    final String cvValue = unlocked ? (moto.cv ?? '') : '??';
    final String ccValue = unlocked ? (moto.cc ?? '') : '??';

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MotoDetailsInfoRow(
            label: S.of(context).captureDate,
            value: moto.dataCattura.toFormattedString()),
        MotoDetailsInfoRow(
            label: S.of(context).brand, value: moto.marcaMoto.nome),
        MotoDetailsInfoRow(label: S.of(context).model, value: moto.nome),
        MotoDetailsInfoRow(
            label: S.of(context).type, value: moto.tipoMoto.nome),
        MotoDetailsInfoRow(
            label: S.of(context).year,
            value: moto.anno == null ? '' : moto.anno.toString()),
        MotoDetailsInfoRow(label: 'CV', value: cvValue),
        MotoDetailsInfoRow(label: 'CC', value: ccValue),
        MotoDetailsInfoRow(label: S.of(context).location, value: moto.luogo),
        MotoDetailsInfoRow(
            label: S.of(context).description, value: moto.descrizione),
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
            label: S.of(context).brand, value: collezioneMoto.marcaMoto.nome),
        MotoDetailsInfoRow(
            label: S.of(context).model, value: collezioneMoto.modello),
        MotoDetailsInfoRow(
            label: S.of(context).type, value: collezioneMoto.tipoMoto.nome),
        MotoDetailsInfoRow(
            label: S.of(context).nation,
            value: collezioneMoto.marcaMoto.nazione ?? '??'),
        MotoDetailsInfoRow(label: 'CV', value: '??'),
        MotoDetailsInfoRow(label: 'CC', value: '??'),
      ],
    );
  }
}
