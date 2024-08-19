import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/marca_moto/marca_moto.dart';
import 'package:pokebike/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:pokebike/app/shared/controllers/tipo_marca_controller.dart';

class AddMotoFormController extends GetxController {
  final RxBool isPerformingRegister = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxList<TipoMoto> availableTipos = <TipoMoto>[].obs;
  final RxList<MarcaMoto> availableMarche = <MarcaMoto>[].obs;

  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modelloController =
      TextEditingController(text: "nome");
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController annoController =
      TextEditingController(text: "1234");
  final TextEditingController luogoController =
      TextEditingController(text: "Qui");
  final TextEditingController descrizioneController =
      TextEditingController(text: "Descrizione");

  @override
  void onInit() {
    super.onInit();
    final TipoMarcaController tipoMarcaController = TipoMarcaController.to;
    availableTipos.addAll(tipoMarcaController.tipi);
    availableMarche.addAll(tipoMarcaController.marche);
  }

  String? marcaValidator(dynamic value) {
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
      'nome': modelloController.text.trim(),
      'anno': annoController.text.trim(),
      'luogo': luogoController.text.trim(),
      'descrizione': descrizioneController.text.trim(),
      'data_cattura': DateTime.now().toIso8601String(),
      'marca_moto_id': availableMarche
          .where((marca) => marca.nome == marcaController.text)
          .first
          .id,
      'tipo_moto_id': availableTipos
          .where((tipo) => tipo.nome == tipoController.text)
          .first
          .id,
    };
  }
}
