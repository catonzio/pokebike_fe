import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/widgets/utils/gradient_text.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

const borderGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(109, 108, 111, 0.5),
    Color.fromRGBO(255, 255, 255, 0.2),
  ],
  stops: [0, 0.9],
);

const textGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFDCDCDC),
    Color(0x00A8A8A8),
  ],
  stops: [0.0, 1.0],
);

const goldenBorderGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(194, 164, 2, 1),
    Color.fromRGBO(240, 208, 36, 0.86),
    Color.fromRGBO(194, 164, 2, 0.84),
    Color.fromRGBO(240, 208, 36, 0.27),
    Color.fromRGBO(255, 255, 255, 0.25)
    // Color.fromRGBO(109, 108, 111, 0.5),
    // Color.fromRGBO(255, 255, 255, 0.44)
  ],
);

const goldenTextGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFC2A402),
    Color(0x00FFFFFF),
  ],
  stops: [0.0, 1.0],
);

class GarageCardWidget extends StatelessWidget {
  final int index;
  final Moto? moto;
  final Function() onTap;

  const GarageCardWidget(
      {super.key,
      required this.index,
      required this.moto,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(16);
    final bool isGolden = index > 0 && (index % 10 == 0);
    Widget child;

    if (moto != null) {
      child = GestureDetector(
        onTap: onTap,
        child: MimageNetwork(
          path: moto!.avatar,
          borderRadius: borderRadius,
        ),
      );
    } else {
      child = Container(
        decoration: BoxDecoration(
          color: MColors.primary,
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        child: GradientText(
          index.toString(),
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          gradient: isGolden ? goldenTextGradient : textGradient,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: isGolden ? goldenBorderGradient : borderGradient,
      ),
      child: child,
    );
  }
}
