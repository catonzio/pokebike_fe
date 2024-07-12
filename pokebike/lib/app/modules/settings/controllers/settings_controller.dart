import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find<SettingsController>();
  User? argumentUser = Get.arguments as User?;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  final Rxn<User> user = Rxn<User>();

  @override
  void onInit() async {
    notificationsEnabled.value =
        (await Permission.notification.request()).isGranted;
    await setUser(argumentUser);
    nameController.text = user.value?.name ?? "";
    surnameController.text = user.value?.surname ?? "";
    dataController.text = user.value?.birthdate.toFormattedString() ?? "";

    super.onInit();
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
