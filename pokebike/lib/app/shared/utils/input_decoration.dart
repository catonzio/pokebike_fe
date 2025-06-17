import 'package:flutter/material.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:get/get.dart';

InputDecoration transparentInputDecoration(String hintText,
    {bool isPassword = false,
    Function()? toggleObscurePassword,
    Color fillColor = Colors.transparent,
    Color textColor = Colors.white}) {
  return defaultInputDecoration(hintText,
      isPassword: isPassword,
      toggleObscurePassword: toggleObscurePassword,
      fillColor: fillColor,
      textColor: textColor);
}

InputDecoration darkInputDecoration(String hintText,
    {bool isPassword = false,
    Function()? toggleObscurePassword,
    Color fillColor = MColors.primary,
    Color textColor = Colors.white}) {
  return defaultInputDecoration(hintText,
      isPassword: isPassword,
      toggleObscurePassword: toggleObscurePassword,
      fillColor: fillColor,
      textColor: textColor);
}

InputDecoration lightInputDecoration(String hintText,
    {bool isPassword = false,
    Function()? toggleObscurePassword,
    Color fillColor = Colors.white,
    Color textColor = MColors.primary}) {
  return defaultInputDecoration(hintText,
      isPassword: isPassword,
      fillColor: fillColor,
      textColor: textColor,
      toggleObscurePassword: toggleObscurePassword);
}

InputDecoration defaultInputDecoration(String hintText,
    {bool isPassword = false,
    Function()? toggleObscurePassword,
    required Color fillColor,
    required Color textColor}) {
  return InputDecoration(
      filled: true,
      fillColor: fillColor,
      hintText: hintText,
      hintStyle: TextStyle(
          color: textColor.withValues(alpha: 0.4),
          fontSize: 14,
          fontWeight: FontWeight.w400),
      errorStyle: const TextStyle(fontSize: 12, color: MColors.error),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: MColors.error, width: 2),
      ),
      contentPadding: const EdgeInsets.all(16),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: MColors.secondaryDark, width: 2),
      ),
      suffix: isPassword
          ? InkWell(
              onTap: toggleObscurePassword,
              child: Image.asset("assets/icons/password_obscure.png",
                  height: 18, width: 18, fit: BoxFit.contain),
            )
          : null,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: MColors.secondaryDark, width: 2),
      ));
}
