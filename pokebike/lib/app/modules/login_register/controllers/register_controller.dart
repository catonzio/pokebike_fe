import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/providers/auth_provider.dart';
import 'package:moto_hunters/generated/l10n.dart';
import 'dart:developer';
import 'package:moto_hunters/app/shared/utils/image_compress_helper.dart';

class RegisterController extends GetxController {
  final RxBool obscurePassword = true.obs;

  void toggleObscurePassword() => obscurePassword.toggle();

  final RxBool isPrivacyAccepted = false.obs;

  final RxBool isPerformingRegister = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cognomeController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final Rx<XFile?> avatar = Rx<XFile?>(null);

  final Map<String, bool> fieldsUniqueValidationFail = {
    'email': false,
    'username': false,
    'avatar': false,
  };

  final AuthProvider provider;

  RegisterController({required this.provider});

  @override
  onInit() {
    super.onInit();
    final data = Get.arguments as Map<String, dynamic>?;
    if (data != null) {
      setRegisterData(data);
    }
  }

  void setRegisterData(Map<String, dynamic> data) {
    if (data.containsKey("email")) {
      emailController.text = data["email"] ?? "";
    }
    if (data.containsKey("name_surname")) {
      final text = data["name_surname"] ?? "";
      if (text.isNotEmpty) {
        final nameSurname = text.split(" ");
        if (nameSurname.isNotEmpty) {
          nomeController.text = nameSurname[0];
        }
        if (nameSurname.length > 1) {
          cognomeController.text = nameSurname[1];
        }
      }
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).emailNoEmpty;
    }
    if (!value.isEmail) {
      return S.of(Get.context!).emailNotValid;
    }
    if (fieldsUniqueValidationFail['email']!) {
      fieldsUniqueValidationFail['email'] = false;
      return S.of(Get.context!).emailNotUnique;
    }
    return null;
  }

  String? nomeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).nameNoEmpty;
    }
    return null;
  }

  String? cognomeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).surnameNoEmpty;
    }
    return null;
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).usernameNoEmpty;
    }
    if (fieldsUniqueValidationFail['username']!) {
      fieldsUniqueValidationFail['username'] = false;
      return S.of(Get.context!).usernameNotUnique;
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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).pwdNoEmpty;
    }
    if (value != passwordController.text) {
      return S.of(Get.context!).pwdNoCoincide;
    }
    return null;
  }

  String? birthdateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).birthdayNoEmpty;
    }
    return null;
  }

  String? avatarValidator(XFile? value) {
    if (value == null && avatar.value == null) {
      return S.of(Get.context!).mustSelectAvatar;
    }
    if (fieldsUniqueValidationFail['avatar']!) {
      fieldsUniqueValidationFail['avatar'] = false;
      return S.of(Get.context!).avatarTooBig;
    }
    return null;
  }

  void setAvatar(XFile value) {
    avatar.value = value;
  }

  Future<ApiResponse> register() async {
    isPerformingRegister.value = true;
    try {
      log('Register request payload: email=${emailController.text.trim()}, nome=${nomeController.text.trim()}, cognome=${cognomeController.text.trim()}, username=${usernameController.text.trim()}, birthdate=${birthdateController.text.trim()}, avatar=${avatar.value?.path}');
      ApiResponse response = await provider.register(
        emailController.text.trim(),
        nomeController.text.trim(),
        cognomeController.text.trim(),
        usernameController.text.trim(),
        passwordController.text.trim(),
        birthdateController.text.trim(),
        await compressImage(avatar.value!),
      );
      if (!response.success) {
        log('Register failed: status=${response.status}, message=${response.message}, data=${response.data}');
      }
      if (response.status == 422 && response.message.contains("validation")) {
        final Map<String, dynamic> data = response.data;
        for (MapEntry<String, dynamic> validations in data.entries) {
          fieldsUniqueValidationFail[validations.key] = true;
        }
      }
      return response;
    } catch (e, st) {
      log('Error during register: $e', stackTrace: st);
      return ApiResponse.error(message: e.toString(), data: null);
    } finally {
      isPerformingRegister.value = false;
    }
  }

  togglePrivacy(bool? value) {
    isPrivacyAccepted.value = value ?? false;
  }
}
