import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find<SettingsController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isEditing = false.obs;
  set editing(bool value) => isEditing.value = value;
  bool get editing => isEditing.value;

  final RxBool isSaving = false.obs;
  set saving(bool value) => isSaving.value = value;
  bool get saving => isSaving.value;

  final RxBool notificationsEnabled = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  @override
  void onInit() async {
    notificationsEnabled.value =
        (await Permission.notification.request()).isGranted;
    super.onInit();
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

  Future<bool> salva() {
    print("Salva: ");
    print("Nome: ${nameController.text}");
    print("Cognome: ${surnameController.text}");
    print("Username: ${usernameController.text}");
    print("Data: ${dataController.text}");
    saving = true;
    return Future.delayed(const Duration(seconds: 2), () {
      saving = false;
      return true;
    });
  }
}
