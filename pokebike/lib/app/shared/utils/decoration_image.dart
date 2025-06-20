import 'package:flutter/material.dart';
import 'package:get/get.dart';

DecorationImage getLightDecorationImage(String path, double opacity) {
  return getDecorationImage(path, opacity, Colors.white, BlendMode.lighten);
}

DecorationImage getDarkDecorationImage(String path, double opacity) {
  return getDecorationImage(path, opacity, Colors.black, BlendMode.darken);
}

DecorationImage getLightDecorationImageApi(String path, double opacity) {
  return getDecorationImageApi(path, opacity, Colors.white, BlendMode.lighten);
}

DecorationImage getDarkDecorationImageApi(String path, double opacity) {
  return getDecorationImageApi(path, opacity, Colors.black, BlendMode.darken);
}

DecorationImage getDecorationImage(
    String path, double opacity, Color color, BlendMode blendMode) {
  return DecorationImage(
    image: AssetImage(path),
    colorFilter: ColorFilter.mode(
      color.withValues(alpha: opacity),
      blendMode,
    ),
    fit: BoxFit.cover,
  );
}

DecorationImage getDecorationImageApi(
    String path, double opacity, Color color, BlendMode blendMode) {
  return DecorationImage(
    image: Image.network(path).image,
    colorFilter: ColorFilter.mode(
      color.withValues(alpha: opacity),
      blendMode,
    ),
    fit: BoxFit.cover,
  );
}
