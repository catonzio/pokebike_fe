import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/marca_moto/marca_moto.dart';
import 'package:pokebike/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:pokebike/app/shared/controllers/tipo_marca_controller.dart';
import 'package:pokebike/app/shared/providers/tipo_marca_provider.dart';

class AddMotoFormController extends GetxController {
  final RxBool isPerformingRegister = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxList<TipoMoto> availableTipos = <TipoMoto>[].obs;
  final RxList<MarcaMoto> availableMarche = <MarcaMoto>[].obs;
  final RxList<String> availableNames = <String>[].obs;

  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modelloController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController annoController = TextEditingController();
  final TextEditingController luogoController = TextEditingController();
  final TextEditingController descrizioneController = TextEditingController();

  final TipoMarcaProvider provider;

  TipoMoto get tipoMotoString =>
      availableTipos.where((p0) => p0.nome == tipoController.text.trim()).first;
  MarcaMoto get marcaMotoString => availableMarche
      .where(((p0) => p0.nome == marcaController.text.trim()))
      .first;

  AddMotoFormController({required this.provider});

  @override
  void onInit() {
    super.onInit();
    final TipoMarcaController tipoMarcaController = TipoMarcaController.to;
    availableMarche.addAll(tipoMarcaController.marche);
    marcaController.addListener(_marcaOnChanged);
    modelloController.addListener(_modelloOnChanged);
    // availableNames.addAll(tipoMarcaController.modelli);
  }

  @override
  void dispose() {
    super.dispose();
    marcaController.dispose();
    modelloController.dispose();
    tipoController.dispose();
    annoController.dispose();
    luogoController.dispose();
    descrizioneController.dispose();
  }

  Future<void> _marcaOnChanged() async {
    String value = marcaController.text.trim();
    modelloController.clear();
    availableNames.clear();
    tipoController.clear();
    List<String> modelli =
        await provider.fetchModelloFromMarcaId(marcaIdFromName(value));
    availableNames.addAll(modelli);
  }

  Future<void> _modelloOnChanged() async {
    String marca = marcaController.text.trim();
    String modello = modelloController.text.trim();
    TipoMoto tipo = await provider.fetchTipoFromMarcaModello(
        marcaIdFromName(marca), modello);
    tipoController.text = tipo.nome;
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

  Map<String, dynamic> getData() {
    // Moto(nome: nome, descrizione: descrizione, anno: anno, luogo: luogo, dataCattura: dataCattura, marcaMoto: marcaMoto, tipoMoto: tipoMoto, numVittorie: numVittorie, numSconfitte: numSconfitte, avatar: avatar)
    return {
      'nome': modelloController.text.trim(),
      'anno': annoController.text.trim(),
      'luogo': luogoController.text.trim(),
      'descrizione': descrizioneController.text.trim(),
      'data_cattura': DateTime.now().toIso8601String(),
      'marca_moto_id': marcaIdFromName(marcaController.text.trim()),
      'tipo_moto_id': tipoIdFromName(tipoController.text.trim()),
    };
  }

  int tipoIdFromName(String nome) {
    return availableTipos.where((tipo) => tipo.nome == nome).first.id;
  }

  int marcaIdFromName(String nome) {
    return availableMarche.where((marca) => marca.nome == nome).first.id;
  }

  void clear() {
    marcaController.text = "";
    modelloController.text = "";
    tipoController.text = "";
    annoController.text = "";
    luogoController.text = "";
    descrizioneController.text = "";
  }
}
