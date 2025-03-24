import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/utils/input_decoration.dart';

import '../controllers/settings_controller.dart';

class SettingsEditingPasswordForm extends GetView<SettingsController> {
  const SettingsEditingPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: transparentInputDecoration('oldPassword'.tr),
              controller: controller.oldPasswordController,
              validator: controller.oldPasswordValidator,
            ),
            TextFormField(
              decoration: transparentInputDecoration('newPassword'.tr),
              controller: controller.newPasswordController,
              validator: controller.newPasswordValidator,
            ),
            TextFormField(
              decoration: transparentInputDecoration('passwordConfirm'.tr),
              controller: controller.confirmPasswordController,
              validator: controller.confirmPasswordValidator,
            ),
          ],
        ));
  }
}
