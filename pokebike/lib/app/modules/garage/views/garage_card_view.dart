import 'package:flutter/material.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class GarageCardWidget extends StatelessWidget {
  final Moto moto;
  final Function() onTap;
  const GarageCardWidget({super.key, required this.moto, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: MimageNetwork(
        path: moto.avatar,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
