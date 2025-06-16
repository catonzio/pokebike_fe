import 'package:flutter/material.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';
import 'package:get/get.dart';

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
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: MimageNetwork(
            path: moto.avatar?.url ?? '',
            borderRadius: BorderRadius.circular(16),
            cacheHeight: 370,
            cacheWidth: 370,
          ),
        ),
        if (moto.isFavorita)
          const Positioned(
              top: 10,
              left: 10,
              child: Icon(
                Icons.favorite,
                color: MColors.secondary,
                size: 16,
              ))
      ],
    );
  }
}
