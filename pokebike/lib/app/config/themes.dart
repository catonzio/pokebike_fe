import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_hunters/app/config/colors.dart';

class Themes {
  static dark() {
    ThemeData theme = ThemeData.dark();
    theme = theme.copyWith(
        primaryColor: MColors.primary,
        primaryColorDark: MColors.primaryDark,
        primaryColorLight: MColors.primaryLight,
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
        progressIndicatorTheme: theme.progressIndicatorTheme.copyWith(
          circularTrackColor: MColors.primaryLight,
          color: Colors.grey,
          refreshBackgroundColor: MColors.primary,
        ),
        dividerColor: MColors.primary
        // colorScheme: theme.colorScheme.copyWith(secondary: MColors.secondary),
        );
    return theme;
  }

  static const TextStyle darkFormTextStyle = TextStyle(
      color: MColors.primary, fontSize: 14, fontWeight: FontWeight.w400);
  static const TextStyle lightFormTextStyle =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400);
}
