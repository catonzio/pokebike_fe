// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

class LoginController extends GetxController {
  final RxBool _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  set obscurePassword(bool value) => _obscurePassword.value = value;
  void toggleObscurePassword() => _obscurePassword.value = !obscurePassword;

  final RxBool isPerformingLogin = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController(text: "email1@email.com");
  final TextEditingController passwordController =
      TextEditingController(text: "password");

  final AuthProvider provider;

  LoginController({required this.provider});

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "L'email non può essere vuota";
    }
    if (!value.isEmail) {
      return "Inserisci un'email valida";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "La password non può essere vuota";
    }
    if (value.length < 8) {
      return "La password deve essere di almeno 8 caratteri";
    }
    return null;
  }

  Future<ApiResponse> login() async {
    isPerformingLogin.value = true;
    ApiResponse result =
        await provider.login(emailController.text, passwordController.text);
    isPerformingLogin.value = false;
    return result;
    // return Future.delayed(const Duration(seconds: 2), () {
    //   // Random r = Random();
    //   // return r.nextBool();
    //   isPerformingLogin.value = false;
    //   return true;
    // });
  }
}
