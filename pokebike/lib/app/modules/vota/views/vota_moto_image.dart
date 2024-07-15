import 'package:flutter/material.dart';

import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class VotaMotoImage extends StatelessWidget {
  final double height;
  final String motoAvatar;
  final bool reversed;

  const VotaMotoImage(
      {super.key,
      required this.height,
      required this.motoAvatar,
      this.reversed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 4 / 3,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: (reversed
                      ? MColors.votaSecondPlayerColor
                      : MColors.votaFirstPlayerColor)
                  .withOpacity(0.4),
              blurRadius: 64,
              spreadRadius: 8,
              offset: Offset.zero,
              blurStyle: BlurStyle.normal),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: MimageNetwork(
        path: motoAvatar,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
