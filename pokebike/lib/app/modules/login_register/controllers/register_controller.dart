import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RxBool _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  set obscurePassword(bool value) => _obscurePassword.value = value;
  void toggleObscurePassword() => _obscurePassword.value = !obscurePassword;

  final RxBool isPrivacyAccepted = false.obs;

  final RxBool isPerformingRegister = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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

  Future<bool> register() async {
    isPerformingRegister.value = true;
    return Future.delayed(const Duration(seconds: 2), () {
      // Random r = Random();
      // return r.nextBool();
      isPerformingRegister.value = false;
      return true;
    });
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "La password non può essere vuota";
    }
    if (value != passwordController.text) {
      return "Le password non corrispondono";
    }
    return null;
  }

  togglePrivacy(bool? value) {
    isPrivacyAccepted.value = value ?? false;
  }
}
