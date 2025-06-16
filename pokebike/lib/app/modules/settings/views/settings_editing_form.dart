import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/utils/input_decoration.dart';

import '../controllers/settings_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class SettingsEditingForm extends GetView<SettingsController> {
  const SettingsEditingForm({
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
              decoration: transparentInputDecoration(S.of(context).name),
              controller: controller.nameController,
            ),
            TextFormField(
              decoration: transparentInputDecoration(S.of(context).surname),
              controller: controller.surnameController,
            ),
            TextFormField(
              decoration: transparentInputDecoration(S.of(context).username),
              controller: controller.usernameController,
            ),
            TextFormField(
              decoration: transparentInputDecoration(S.of(context).birthday),
              controller: controller.dataController,
              onTap: () => selectDate(context),
            ),
          ],
        ));
  }

  selectDate(BuildContext context) async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (time != null) {
      controller.dataController.text =
          "${time.day.toString().padLeft(2, "0")}/${time.month.toString().padLeft(2, "0")}/${time.year}";
    }
  }
}
