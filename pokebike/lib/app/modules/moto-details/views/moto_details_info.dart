import 'package:flutter/material.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';

import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/moto-details/views/moto_details_info_row.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';

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
            label: "Data cattura", value: moto.dataCattura.toFormattedString()),
        MotoDetailsInfoRow(label: "Marca", value: moto.marcaMoto.nome),
        MotoDetailsInfoRow(label: "Modello", value: moto.nome),
        MotoDetailsInfoRow(label: "Tipo", value: moto.tipoMoto.nome),
        MotoDetailsInfoRow(label: "Anno", value: moto.anno.toString()),
        MotoDetailsInfoRow(label: "Luogo", value: moto.luogo),
        MotoDetailsInfoRow(label: "Descrizione", value: moto.descrizione),
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
            label: "Marca", value: collezioneMoto.marcaMoto.nome),
        MotoDetailsInfoRow(label: "Modello", value: collezioneMoto.modello),
        MotoDetailsInfoRow(label: "Tipo", value: collezioneMoto.tipoMoto.nome),
        MotoDetailsInfoRow(label: "Nazione", value: collezioneMoto.nazione),
        // MotoDetailsInfoRow(
        //     label: "Data cattura", value: moto.dataCattura.toFormattedString()),
        // MotoDetailsInfoRow(label: "Luogo", value: moto.luogo),
        // MotoDetailsInfoRow(label: "Descrizione", value: moto.descrizione),
      ],
    );
  }
}
