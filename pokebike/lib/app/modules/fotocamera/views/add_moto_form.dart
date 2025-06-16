import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/modules/fotocamera/controllers/addmoto_form_controller.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/add_moto_form_field.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/add_moto_form_field_model.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/generated/l10n.dart';

class AddMotoForm extends StatelessWidget {
  final Function(bool) onStartEndSend;
  final Future<bool> Function(Map<String, dynamic>) onSend;
  const AddMotoForm(
      {super.key, required this.onSend, required this.onStartEndSend});

  @override
  Widget build(BuildContext context) {
    return GetX<AddMotoFormController>(builder: (controller) {
      List<MotoFormFieldModel> fields = [
        MotoFormFieldModelDropdown(
            label: S.of(context).brand,
            items: controller.availableMarche
                .map((element) => element.nome)
                .toList(),
            validator: controller.marcaValidator,
            controller: controller.marcaController),
        MotoFormFieldModelDropdown(
            label: S.of(context).model,
            items: controller.availableNames.map((element) => element).toList(),
            validator: controller.modelloValidator,
            controller: controller.modelloController),
        // MotoFormFieldModelDropdown(
        //     label: "Tipo",
        //     items: controller.availableTipos
        //         .map((element) => element.nome)
        //         .toList(),
        //     validator: controller.tipoValidator,
        //     controller: controller.tipoController),
        MotoFormFieldModel(
            label: S.of(context).type,
            // validator: controller.tipoValidator,
            controller: controller.tipoController,
            isNumeric: false,
            readOnly: true),
        MotoFormFieldModel(
            label: 'CV',
            controller: controller.cvController,
            isNumeric: true,
            readOnly: true),
        MotoFormFieldModel(
            label: 'CC',
            controller: controller.ccController,
            isNumeric: true,
            readOnly: true),
        MotoFormFieldModel(
            label: S.of(context).year,
            validator: controller.annoValidator,
            controller: controller.annoController,
            isNumeric: true),

        MotoFormFieldModel(
            label: S.of(context).location,
            validator: controller.luogoValidator,
            controller: controller.luogoController),
        MotoFormFieldModel(
            label: S.of(context).description,
            // validator: controller.descrizioneValidator,
            controller: controller.descrizioneController,
            maxLines: 5)
      ];
      return Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 32, bottom: Constants.bottomNavbarHeight),
          child: Column(
              // padding: EdgeInsets.only(
              //     bottom: Constants.bottomNavbarHeight +
              //         Get.context!.keyboardHeight / 1.5),
              // itemExtent: Get.context!.height * 0.11,
              // mainAxisSize: MainAxisSize.min,
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                ...fields.map((MotoFormFieldModel e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AddMotoFormField(model: e),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: MButton.red(
                    onPressed: () => _addMoto(controller),
                    child: Text(S.of(context).addMoto),
                  ),
                ),
              ]),
        ),
      );
    });
  }

  _addMoto(AddMotoFormController controller) async {
    onStartEndSend(true);
    if (controller.formKey.currentState!.validate()) {
      Map<String, dynamic> data = controller.getData();
      bool success = await onSend(data);
      if (success) {
        controller.clear();
      }
    }
    onStartEndSend(false);
  }
}
