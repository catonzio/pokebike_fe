import 'package:flutter/material.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class GarageCardWidget extends StatelessWidget {
  final int index;
  final Moto moto;
  final Function() onTap;

  const GarageCardWidget(
      {super.key,
      required this.index,
      required this.moto,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MimageNetwork(
        path: moto.avatar,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}