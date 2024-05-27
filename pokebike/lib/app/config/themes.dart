import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';

class Themes {
  static dark() {
    ThemeData theme = ThemeData.dark();
    theme.copyWith(
      primaryColor: MColors.primary,
      primaryColorDark: MColors.primaryDark,
      primaryColorLight: MColors.primaryLight,
    );
    return theme;
  }
}
