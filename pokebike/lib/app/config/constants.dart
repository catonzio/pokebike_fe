import 'package:flutter/material.dart';

class Constants {
  static const double bottomNavbarHeight = 160;

  static const SliverGridDelegate gridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.3,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
  );
}
