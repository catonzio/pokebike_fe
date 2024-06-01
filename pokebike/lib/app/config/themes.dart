import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebike/app/config/colors.dart';

class Themes {
  static dark() {
    ThemeData theme = ThemeData.dark();
    theme = theme.copyWith(
        primaryColor: MColors.primary,
        primaryColorDark: MColors.primaryDark,
        primaryColorLight: MColors.primaryLight,
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
        colorScheme: theme.colorScheme.copyWith(secondary: MColors.secondary));
    return theme;
  }

  static const TextStyle formTextStyle = TextStyle(
      color: MColors.primary, fontSize: 14, fontWeight: FontWeight.w400);
}
