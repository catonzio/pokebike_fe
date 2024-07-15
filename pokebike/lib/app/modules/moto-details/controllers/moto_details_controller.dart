import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/moto-details/moto_details_arguments.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';

class MotoDetailsController extends GetxController {
  final Moto moto = (Get.arguments as MotoDetailsArguments).moto;
  final bool isOwnMoto = (Get.arguments as MotoDetailsArguments).isOwnMoto;
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final RxBool isShowingInfo = false.obs;
  final RxBool isEditingMoto = false.obs;

  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modelloController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController annoController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController luogoController = TextEditingController();
  final TextEditingController descrizioneController = TextEditingController();

  @override
  void onInit() {
    // marcaController.text = moto.marcaMoto.nome;
    modelloController.text = moto.nome;
    // tipoController.text = moto.tipoMoto.nome;
    annoController.text = moto.anno.toString();
    dataController.text = moto.dataCattura.toFormattedString();
    luogoController.text = moto.luogo;
    descrizioneController.text = moto.descrizione;
    super.onInit();
  }

  void toggleShowingInfo({bool? value}) {
    if (value != null) {
      isShowingInfo.value = value;
    } else {
      isShowingInfo.toggle();
    }
  }

  void toggleEditingMoto({bool? value}) {
    if (value != null) {
      isEditingMoto.value = value;
    } else {
      isEditingMoto.toggle();
    }
  }

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

  Map<String, dynamic> getData() {
    return {
      'marca': marcaController.text.trim(),
      'nome': modelloController.text.trim(),
      'tipo': tipoController.text.trim(),
      'anno': annoController.text.trim(),
      'luogo': luogoController.text.trim(),
      'descrizione': descrizioneController.text.trim(),
      'data_cattura':
          DateTime.tryParse(dataController.text.trim())?.toIso8601String(),
      'marca_moto_id': 1,
      'tipo_moto_id': 1,
    };
  }

  annullaEdit() {
    toggleEditingMoto(value: false);
  }

  salva() {}
}
