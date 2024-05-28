import 'package:flutter/material.dart';

DecorationImage getDecorationImage(String path, double opacity) {
  return DecorationImage(
    image: AssetImage(path),
    colorFilter: ColorFilter.mode(
      Colors.black.withOpacity(opacity),
      BlendMode.darken,
    ),
    fit: BoxFit.cover,
  );
}
