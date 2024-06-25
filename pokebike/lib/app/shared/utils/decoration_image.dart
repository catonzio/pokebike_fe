import 'package:flutter/material.dart';

DecorationImage getLightDecorationImage(String path, double opacity) {
  return getDecorationImage(path, opacity, Colors.white, BlendMode.lighten);
}

DecorationImage getDarkDecorationImage(String path, double opacity) {
  return getDecorationImage(path, opacity, Colors.black, BlendMode.darken);
}

DecorationImage getDecorationImage(
    String path, double opacity, Color color, BlendMode blendMode) {
  return DecorationImage(
    image: AssetImage(path),
    colorFilter: ColorFilter.mode(
      color.withOpacity(opacity),
      blendMode,
    ),
    fit: BoxFit.cover,
  );
}
