import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form_field.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form_field_model.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';

import '../controllers/moto_details_controller.dart';

class MotoDetailsInfoEdit extends GetView<MotoDetailsController> {
  const MotoDetailsInfoEdit({super.key});

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

    return Form(
      key: controller.formKey,
      child: Column(
          // padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
          // itemExtent: context.height * 0.11,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...fields.map((MotoFormFieldModel e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AddMotoFormField(model: e),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: MButton.red(
                onPressed: () => controller.salva(),
                child: const Text("Salva"),
              ),
            ),
            MButton.white(
                onPressed: () => controller.annullaEdit(),
                child: const Text(
                  "Annulla",
                  style: TextStyle(color: Colors.black),
                ))
          ]),
    );

    //  Column(
    //   children: [
    //     MButton.red(onPressed: () => controller.salva(), child: const Text("Salva")),
    //     MButton.white(
    //         onPressed: () => controller.annullaEdit(),
    //         child: const Text(
    //           "Annulla",
    //           style: TextStyle(color: Colors.black),
    //         ))
    //   ],
    // );
  }
}
