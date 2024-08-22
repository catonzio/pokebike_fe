import 'package:flutter/material.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';

import 'package:pokebike/app/modules/garage/views/collezione/collezione_card_widget.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_photo.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class MotoMainPhoto extends StatelessWidget {
  final CollezioneMoto collezioneMoto;

  const MotoMainPhoto({super.key, required this.collezioneMoto});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: collezioneMoto.id,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: CollezioneCardWidget(
            collezioneMoto: collezioneMoto,
            index: 0,
            onTap: () {
              collezioneMoto.moto == null
                  ? null
                  : context.navigator.push(
                      MaterialPageRoute(
                          builder: (context) => MotoDetailPhoto(
                                tag: collezioneMoto.moto!.id.toString(),
                                avatarUrl: collezioneMoto.moto!.avatar,
                              )),
                    );
            },
          ),
        ),
      ),
    );
  }
}
