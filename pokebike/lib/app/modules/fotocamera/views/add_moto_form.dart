import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/fotocamera/controllers/addmoto_form_controller.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form_field.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form_field_model.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';

class AddMotoForm extends GetView<AddMotoFormController> {
  final Function(Map<String, dynamic>) onSend;
  const AddMotoForm({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    List<MotoFormFieldModel> fields = [
      MotoFormFieldModelDropdown(
          label: "Marca",
          items: ["Yamaha", "Honda", "Suzuki", "Kawasaki", "Ducati"],
          validator: controller.marcaValidator,
          controller: controller.marcaController),
      MotoFormFieldModel(
          label: "Modello",
          validator: controller.modelloValidator,
          controller: controller.modelloController),
      MotoFormFieldModelDropdown(
          label: "Tipo",
          items: ["Yamaha", "Honda", "Suzuki", "Kawasaki", "Ducati"],
          validator: controller.tipoValidator,
          controller: controller.tipoController),
      MotoFormFieldModel(
          label: "Anno",
          validator: controller.annoValidator,
          controller: controller.annoController,
          isNumeric: true),
      MotoFormFieldModel(
          label: "Luogo",
          validator: controller.luogoValidator,
          controller: controller.luogoController),
      MotoFormFieldModel(
          label: "Descrizione",
          validator: controller.descrizioneValidator,
          controller: controller.descrizioneController,
          maxLines: 5)
    ];
    print("Bottom padding: ${MediaQuery.of(context).viewInsets.bottom}");
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: ListView(
            // padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
            // itemExtent: context.height * 0.11,
            // mainAxisSize: MainAxisSize.min,
            physics: const NeverScrollableScrollPhysics(),
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
                  onPressed: _addMoto,
                  child: const Text("Aggiungi moto"),
                ),
              ),
            ]),
      ),
    );
  }

  _addMoto() async {
    if (controller.formKey.currentState!.validate()) {
      Map<String, dynamic> data = controller.getData();
      onSend(data);
    }
  }
}
