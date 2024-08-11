import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMotoFormController extends GetxController {
  final RxBool isPerformingRegister = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController marcaController =
      TextEditingController(text: "Yamaha");
  final TextEditingController modelloController =
      TextEditingController(text: "nome");
  final TextEditingController tipoController =
      TextEditingController(text: "Honda");
  final TextEditingController annoController =
      TextEditingController(text: "1234");
  final TextEditingController luogoController =
      TextEditingController(text: "Qui");
  final TextEditingController descrizioneController =
      TextEditingController(text: "Descrizione");

  String? marcaValidator(dynamic value) {
    print("MARCA VALIDATOR");
    if (value == null || value.isEmpty) {
      return 'Inserisci la marca';
    }
    return null;
  }

  String? modelloValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci il modello';
    }
    return null;
  }

  String? tipoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci il tipo';
    }
    return null;
  }

  String? annoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci l\'anno';
    }
    return null;
  }

  String? luogoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci il luogo';
    }
    return null;
  }

  String? descrizioneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci la descrizione';
    }
    return null;
  }

  addMoto() {}

  Map<String, dynamic> getData() {
    // Moto(nome: nome, descrizione: descrizione, anno: anno, luogo: luogo, dataCattura: dataCattura, marcaMoto: marcaMoto, tipoMoto: tipoMoto, numVittorie: numVittorie, numSconfitte: numSconfitte, avatar: avatar)
    return {
      // 'marca': marcaController.text.trim(),
      'nome': modelloController.text.trim(),
      // 'tipo': tipoController.text.trim(),
      'anno': annoController.text.trim(),
      'luogo': luogoController.text.trim(),
      'descrizione': descrizioneController.text.trim(),
      'data_cattura': DateTime.now().toIso8601String(),
      'marca_moto_id': 1,
      'tipo_moto_id': 2,
    };
  }
}
