import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegisterController extends GetxController {
  final RxBool isPerformingRegisterCheck = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController codeController = TextEditingController();

  String? codeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Il codice non può essere vuoto";
    }
    return null;
  }

  Future<bool> confirmRegister() {
    isPerformingRegisterCheck.value = true;
    return Future.delayed(const Duration(seconds: 2), () {
      isPerformingRegisterCheck.value = false;
      return true;
    });
  }
}
