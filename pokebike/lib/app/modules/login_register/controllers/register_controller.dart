import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

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
      return 'emailNoEmpty'.tr;
    }
    if (!value.isEmail) {
      return 'emailNotValid'.tr;
    }
    if (fieldsUniqueValidationFail['email']!) {
      fieldsUniqueValidationFail['email'] = false;
      return 'emailNotUnique'.tr;
    }
    return null;
  }

  String? nomeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'nameNoEmpty'.tr;
    }
    return null;
  }

  String? cognomeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'surnameNoEmpty'.tr;
    }
    return null;
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'usernameNoEmpty'.tr;
    }
    if (fieldsUniqueValidationFail['username']!) {
      fieldsUniqueValidationFail['username'] = false;
      return 'usernameNotUnique'.tr;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'pwdNoEmpty'.tr;
    }
    if (value.length < 8) {
      return 'pwd8chars'.tr;
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'pwdNoEmpty'.tr;
    }
    if (value != passwordController.text) {
      return 'pwdNoCoincide'.tr;
    }
    return null;
  }

  String? birthdateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'birthdayNoEmpty'.tr;
    }
    return null;
  }

  String? avatarValidator(XFile? value) {
    if (value == null && avatar.value == null) {
      return 'mustSelectAvatar'.tr;
    }
    if (fieldsUniqueValidationFail['avatar']!) {
      fieldsUniqueValidationFail['avatar'] = false;
      return 'avatarTooBig'.tr;
    }
    return null;
  }

  void setAvatar(XFile value) {
    avatar.value = value;
  }

  Future<ApiResponse> register() async {
    isPerformingRegister.value = true;
    ApiResponse response = await provider.register(
      emailController.text.trim(),
      nomeController.text.trim(),
      cognomeController.text.trim(),
      usernameController.text.trim(),
      passwordController.text.trim(),
      birthdateController.text.trim(),
      avatar.value!,
    );
    isPerformingRegister.value = false;
    if (response.status == 422 && response.message.contains("validation")) {
      final Map<String, dynamic> data = response.data;
      for (MapEntry<String, dynamic> validations in data.entries) {
        fieldsUniqueValidationFail[validations.key] = true;
      }
    }
    return response;
  }

  togglePrivacy(bool? value) {
    isPrivacyAccepted.value = value ?? false;
  }
}
