import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form_field.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form_field_model.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

import '../controllers/moto_details_controller.dart';

class MotoDetailsInfoEdit extends GetView<MotoDetailsController> {
  const MotoDetailsInfoEdit({super.key});

  @override
  Widget build(BuildContext context) {
    List<MotoFormFieldModel> fields = [
      MotoFormFieldModelDropdown(
          label: 'brand'.tr,
          items: controller.availableMarche
              .map((element) => element.nome)
              .toList(),
          validator: controller.marcaValidator,
          controller: controller.marcaController),
      MotoFormFieldModel(
          label: 'model'.tr,
          validator: controller.modelloValidator,
          controller: controller.modelloController),
      MotoFormFieldModelDropdown(
          label: 'type'.tr,
          items:
              controller.availableTipos.map((element) => element.nome).toList(),
          validator: controller.tipoValidator,
          controller: controller.tipoController),
      MotoFormFieldModel(
          label: 'year'.tr,
          validator: controller.annoValidator,
          controller: controller.annoController,
          isNumeric: true),
      MotoFormFieldModel(
          label: 'location'.tr,
          validator: controller.luogoValidator,
          controller: controller.luogoController),
      MotoFormFieldModel(
          label: 'description'.tr,
          validator: controller.descrizioneValidator,
          controller: controller.descrizioneController,
          maxLines: 5)
    ];

    return Form(
      key: controller.formKey,
      child: Column(
          // padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
          // itemExtent: context.height * 0.11,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('captureDate'.tr),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      controller.moto!.dataCattura.toFormattedString(),
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
            ...fields.map((MotoFormFieldModel e) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: AddMotoFormField(model: e),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: MButton.red(
                onPressed: () => _salva(context),
                child: Text('save'.tr),
              ),
            ),
            MButton.white(
                onPressed: () => controller.annullaEdit(),
                child: Text(
                  'nullify'.tr,
                  style: const TextStyle(color: Colors.black),
                ))
          ]),
    );
  }

  Future<void> _salva(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      controller.salva().then((ApiResponse response) => context.mounted
          ? handleApiResponse(context, response,
              successMessage: 'dataSaved'.tr,
              onSuccess: (_) => controller.isEditingMoto.value = false)
          : null);
    }
  }
}
