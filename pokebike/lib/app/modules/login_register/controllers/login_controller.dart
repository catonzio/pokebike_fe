// import 'dart:math';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/providers/auth_provider.dart';
import 'package:moto_hunters/generated/l10n.dart';

class LoginController extends GetxController {
  final RxBool _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  set obscurePassword(bool value) => _obscurePassword.value = value;
  void toggleObscurePassword() => _obscurePassword.value = !obscurePassword;

  final RxBool isPerformingLogin = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailFormKey = GlobalKey<FormFieldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthProvider provider;

  LoginController({required this.provider});

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).emailNoEmpty;
    }
    if (!value.isEmail) {
      return S.of(Get.context!).emailNotValid;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).pwdNoEmpty;
    }
    if (value.length < 8) {
      return S.of(Get.context!).pwd8chars;
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

  Future<bool> checkToken() async {
    ApiResponse result = await provider.checkToken();
    // Consider HTTP 200 as success if API does not return a 'success' flag
    return result.success || result.status == HttpStatus.ok;
  }

  Future<ApiResponse> passwordForgot() async {
    ApiResponse response =
        await provider.passwordForgot(emailController.text.trim());
    return response;
  }
}
