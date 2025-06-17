import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/shared/widgets/utils/gradient_text.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';

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

const LinearGradient goldenBorderGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(194, 164, 2, 1),
    Color.fromRGBO(240, 208, 36, 0.86),
    Color.fromRGBO(194, 164, 2, 0.84),
    Color.fromRGBO(240, 208, 36, 0.27),
    // Color.fromRGBO(255, 255, 255, 0.25)
  ],
);

const LinearGradient greenBorderGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(0, 128, 0, 1),
    Color.fromRGBO(50, 205, 50, 0.86),
    Color.fromRGBO(0, 128, 0, 0.84),
    Color.fromRGBO(50, 205, 50, 0.27),
    // Color.fromRGBO(240, 255, 240, 0.25)
  ],
);

const LinearGradient violetBorderGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(148, 0, 211, 1),
    Color.fromRGBO(186, 85, 211, 0.86),
    Color.fromRGBO(148, 0, 211, 0.84),
    Color.fromRGBO(186, 85, 211, 0.27),
    // Color.fromRGBO(230, 230, 250, 0.25)
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

class CollezioneCardWidget extends StatelessWidget {
  final int index;
  final CollezioneMoto collezioneMoto;
  final Function()? onTap;

  const CollezioneCardWidget(
      {super.key,
      required this.index,
      required this.collezioneMoto,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(16);
    // final bool isGolden = index > 0 && (index % 10 == 0);
    late LinearGradient gradient;
    switch (collezioneMoto.rarita) {
      case 0:
        gradient = borderGradient;
        break;
      case 1:
        gradient = greenBorderGradient;
        break;
      case 2:
        gradient = violetBorderGradient;
        break;
      case 3:
        gradient = goldenBorderGradient;
        break;
    }
    Widget child;

    if (collezioneMoto.moto != null) {
      child = MimageNetwork(
        path: collezioneMoto.moto!.avatar?.url ?? '',
        borderRadius: borderRadius,
        cacheHeight: 500,
        cacheWidth: 500,
      );
    } else {
      child = Container(
        decoration: BoxDecoration(
          color: MColors.primary,
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        child: GradientText(collezioneMoto.id.toString(),
            style: Get.context!.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
            gradient: gradient),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(borderRadius: borderRadius, gradient: gradient),
      child: GestureDetector(onTap: onTap, child: child),
    );
  }
}
