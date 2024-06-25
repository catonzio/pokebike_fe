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

  final TextEditingController emailController = TextEditingController(text: "email21@email.com");
  final TextEditingController nomeController = TextEditingController(text: "nome");
  final TextEditingController cognomeController = TextEditingController(text: "cognome");
  final TextEditingController usernameController = TextEditingController(text: "username2");
  final TextEditingController passwordController = TextEditingController(text: "password");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "password");
  final TextEditingController birthdateController = TextEditingController(text: "14-05-1997");
  final Rx<XFile?> avatar = Rx<XFile?>(null);

  final AuthProvider provider;

  RegisterController({required this.provider});

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "L'email non può essere vuota";
    }
    if (!value.isEmail) {
      return "Inserisci un'email valida";
    }
    return null;
  }

  String? nomeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Il nome non può essere vuoto";
    }
    return null;
  }

  String? cognomeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Il cognome non può essere vuoto";
    }
    return null;
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "L'username non può essere vuoto";
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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "La password non può essere vuota";
    }
    if (value != passwordController.text) {
      return "Le password non corrispondono";
    }
    return null;
  }

  String? birthdateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "La data di nascita non può essere vuota";
    }
    return null;
  }

  String? avatarValidator(XFile? value) {
    if (value == null && avatar.value == null) {
      return "Devi selezionare un avatar";
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
    return response;
  }

  togglePrivacy(bool? value) {
    isPrivacyAccepted.value = value ?? false;
  }
}
