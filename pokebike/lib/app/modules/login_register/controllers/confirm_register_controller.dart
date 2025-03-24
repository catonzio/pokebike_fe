import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/providers/auth_provider.dart';

class ConfirmRegisterController extends GetxController {
  final RxBool isPerformingRegisterCheck = false.obs;
  final RxBool isAskingCode = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController codeController = TextEditingController();

  final AuthProvider provider;

  ConfirmRegisterController({required this.provider});

  @override
  void onReady() {
    askCode();
    super.onReady();
  }

  String? codeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'codeEmpty'.tr;
    }
    return null;
  }

  Future<ApiResponse> confirmRegister() async {
    isPerformingRegisterCheck.value = true;
    ApiResponse response =
        await provider.verifyCode(codeController.text.trim());
    isPerformingRegisterCheck.value = false;
    return response;
    // return Future.delayed(const Duration(seconds: 2), () {
    //   isPerformingRegisterCheck.value = false;
    //   return true;
    // });
  }

  Future<ApiResponse> askCode() async {
    isAskingCode.value = true;
    ApiResponse response = await provider.askVerificationCode();
    isAskingCode.value = false;
    return response;
  }
}
