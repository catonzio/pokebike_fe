import 'package:flutter/material.dart';

import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_photo.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class MotoMainPhoto extends StatelessWidget {
  final Moto moto;

  const MotoMainPhoto({super.key, required this.moto});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: moto.id,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => context.navigator.push(
            MaterialPageRoute(
                builder: (context) => MotoDetailPhoto(
                      tag: moto.id.toString(),
                      avatarUrl: moto.avatar,
                    )),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: MimageNetwork(
              borderRadius: BorderRadius.circular(16),
              path: moto.avatar,
            ),
          ),
        ),
      ),
    );
  }
}
