import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';

InputDecoration inputDecoration(String hintText,
    {bool isPassword = false, Function()? toggleObscurePassword}) {
  return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: TextStyle(
          color: MColors.primary.withOpacity(0.4),
          fontSize: 14,
          fontWeight: FontWeight.w400),
      // errorStyle: const TextStyle(fontSize: 12, color: MColors.error),
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
