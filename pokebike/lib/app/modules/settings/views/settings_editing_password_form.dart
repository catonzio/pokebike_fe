import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/utils/input_decoration.dart';

import '../controllers/settings_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
              decoration: transparentInputDecoration(S.of(context).oldPassword),
              controller: controller.oldPasswordController,
              validator: controller.oldPasswordValidator,
            ),
            TextFormField(
              decoration: transparentInputDecoration(S.of(context).newPassword),
              controller: controller.newPasswordController,
              validator: controller.newPasswordValidator,
            ),
            TextFormField(
              decoration: transparentInputDecoration(S.of(context).passwordConfirm),
              controller: controller.confirmPasswordController,
              validator: controller.confirmPasswordValidator,
            ),
          ],
        ));
  }
}
