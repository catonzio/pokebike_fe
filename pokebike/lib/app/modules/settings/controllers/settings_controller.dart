import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/settings/providers/settings_provider.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find<SettingsController>();

  User? argumentUser = Get.arguments as User?;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isEditingPassword = false.obs;
  set editingPassword(bool value) => isEditingPassword.value = value;
  bool get editingPassword => isEditingPassword.value;

  final RxBool isEditing = false.obs;
  set editing(bool value) => isEditing.value = value;
  bool get editing => isEditing.value;

  final RxBool isSaving = false.obs;
  set saving(bool value) => isSaving.value = value;
  bool get saving => isSaving.value;

  final RxBool isFetchingUser = false.obs;
  final RxBool notificationsEnabled = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Rxn<User> user = Rxn<User>();

  final SettingsProvider provider;

  SettingsController({required this.provider});

  @override
  void onReady() async {
    PermissionStatus status = await Permission.notification.request();
    notificationsEnabled.value = [
      PermissionStatus.granted,
      PermissionStatus.limited,
      PermissionStatus.restricted,
      PermissionStatus.provisional
    ].contains(status);

    await setUser(argumentUser);
    nameController.text = user.value?.name ?? "";
    surnameController.text = user.value?.surname ?? "";
    usernameController.text = user.value?.username ?? "";
    dataController.text = user.value?.birthdate.toFormattedString() ?? "";

    super.onReady();
  }

  Future<void> setUser(User? user) async {
    this.user.value = user;
    // if (user == null) {
    //   isFetchingUser.value = true;
    //   this.user.value = await provider.fetchUserMe();
    //   isFetchingUser.value = false;
    // }
    // if (this.user.value == null && user != null) {
    //   this.user.value = user;
    // }
  }

  Future<bool> openNotificationsSettings() async {
    if (Platform.isWindows) {
      return await launchUrl(Uri.parse("ms-settings:notifications"));
    }
    if (Platform.isMacOS) {
      return await launchUrl(Uri.parse(
          "x-apple.systempreferences:com.apple.preference.notifications"));
    }
    if (Platform.isLinux) {
      return await launchUrl(Uri.parse("gnome-control-center"));
    }
    if (Platform.isAndroid || Platform.isIOS) {
      try {
        await AppSettings.openAppSettings(
            type: AppSettingsType.notification, asAnotherTask: true);
        notificationsEnabled.value =
            (await Permission.notification.request()).isGranted;
        return notificationsEnabled.value;
      } catch (e) {
        return false;
      }
      // return await launchUrl(Uri.parse("package:com.android.settings"));
    }
    // if (Platform.isIOS) return await launchUrl(Uri.parse("app-settings:"));
    return false;
  }

  String? oldPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci la vecchia password';
    }
    if (value.length < 8) {
      return 'La password deve essere di almeno 8 caratteri';
    }
    return null;
  }

  String? newPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci la nuova password';
    }
    if (value.length < 8) {
      return 'La password deve essere di almeno 8 caratteri';
    }
    if (value.trim() != confirmPasswordController.text.trim()) {
      return 'Le password non coincidono';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci la password di conferma';
    }
    if (value.length < 8) {
      return 'La password deve essere di almeno 8 caratteri';
    }
    if (value.trim() != newPasswordController.text.trim()) {
      return 'Le password non coincidono';
    }
    return null;
  }

  Future<ApiResponse> salvaPassword() async {
    Map<String, dynamic> data = {
      'old_password': oldPasswordController.text.trim(),
      'new_password': newPasswordController.text.trim()
    };
    saving = true;
    ApiResponse response = await provider.updatePassword(data);
    if (response.success) {
      Storage.to.apiToken = response.data;
      oldPasswordController.text = "";
      newPasswordController.text = "";
      confirmPasswordController.text = "";
    }
    saving = false;
    return response;
  }

  Future<ApiResponse> salva() async {
    Map<String, dynamic> data = {
      'name': nameController.text.trim(),
      'surname': surnameController.text.trim(),
      'username': usernameController.text.trim(),
      'birthdate': dataController.text.trim().replaceAll("/", "-")
    };
    saving = true;
    ApiResponse response = await provider.updateUser(user.value?.id ?? 0, data);
    saving = false;
    return response;
  }

  Future<ApiResponse> deleteUser() async {
    if (user.value != null) {
      return provider.deleteUser(user.value!.id);
    } else {
      return ApiResponse.error(message: 'noInternet'.tr, data: {});
    }
  }

  void updateLocale(Locale locale) {
    Get.updateLocale(locale);
    Storage.to.currentLocale = locale.languageCode.toLowerCase();
    print(Storage.to.currentLocale);
  }
}
