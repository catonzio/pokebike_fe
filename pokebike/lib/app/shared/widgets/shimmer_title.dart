import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

const Color grey900 = Color(0xFF212121);
const Color grey600 = Color(0xFF757575);

class ShimmerTitle extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final List<Color> colors;
  final double angle;
  final Duration duration;

  const ShimmerTitle(
      {super.key,
      required this.text,
      this.style = const TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      this.textAlign,
      this.colors = const [grey900, grey600, grey900],
      this.angle = pi / 4,
      this.duration = const Duration(seconds: 3)});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(textStyle: style),
      textAlign: textAlign,
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: angle,
          duration: duration,
          colors: colors,
        );
  }
}
