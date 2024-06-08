import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/utils/input_decoration.dart';

import '../controllers/settings_controller.dart';



class SettingsEditingForm extends GetView<SettingsController> {
  const SettingsEditingForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormField(
          decoration: transparentInputDecoration("Nome"),
        ),
        TextFormField(
          decoration: transparentInputDecoration("Cognome"),
        ),
        TextFormField(
          decoration: transparentInputDecoration("Username"),
        ),
        TextFormField(
          decoration: transparentInputDecoration("Data di nascita"),
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