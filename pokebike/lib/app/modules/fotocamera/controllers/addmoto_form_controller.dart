import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_hunters/app/data/models/marca_moto/marca_moto.dart';
import 'package:moto_hunters/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/shared/controllers/tipo_marca_controller.dart';
import 'package:moto_hunters/app/shared/providers/tipo_marca_provider.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
  final TextEditingController cvController = TextEditingController();
  final TextEditingController ccController = TextEditingController();

  final TipoMarcaProvider provider;
  final MotoProvider motoProvider;

  List<Moto> myMotos = [];

  TipoMoto get tipoMotoString =>
      availableTipos.where((p0) => p0.nome == tipoController.text.trim()).first;
  MarcaMoto get marcaMotoString => availableMarche
      .where(((p0) => p0.nome == marcaController.text.trim()))
      .first;

  AddMotoFormController({required this.provider, required this.motoProvider});

  @override
  void onInit() {
    super.onInit();
    final TipoMarcaController tipoMarcaController = TipoMarcaController.to;
    availableMarche.addAll(tipoMarcaController.marche);
    marcaController.addListener(_marcaOnChanged);
    modelloController.addListener(_modelloOnChanged);
    // availableNames.addAll(tipoMarcaController.modelli);
    _loadMyMotos();
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
    cvController.dispose();
    ccController.dispose();
  }

  Future<void> _loadMyMotos() async {
    try {
      myMotos = await motoProvider.fetchMotos();
    } catch (_) {
      myMotos = [];
    }
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

    if (marca.isEmpty || modello.isEmpty) return;

    // Recupera i dati completi della collezione moto (con cc e cv)
    CollezioneMoto? collezioneMoto = await provider
        .fetchCollezioneMotoFromMarcaModello(marcaIdFromName(marca), modello);

    if (collezioneMoto != null) {
      // Popola il campo tipo
      tipoController.text = collezioneMoto.tipoMoto.nome;
      availableTipos.clear();
      availableTipos.add(collezioneMoto.tipoMoto);

      // Determina se l'utente ha già catturato almeno una moto
      // associata a questa specifica CollezioneMoto (stessa marca, tipo e modello)
      final bool hasCapture = myMotos.any((moto) =>
          moto.marcaMoto.id == collezioneMoto.marcaMoto.id &&
          moto.tipoMoto.id == collezioneMoto.tipoMoto.id &&
          moto.nome.toLowerCase() == collezioneMoto.modello.toLowerCase());

      if (hasCapture) {
        ccController.text = collezioneMoto.cc;
        cvController.text = collezioneMoto.cv;
      } else {
        ccController.text = '??';
        cvController.text = '??';
      }
    } else {
      // Fallback al metodo precedente se non trovato
      TipoMoto tipo = await provider.fetchTipoFromMarcaModello(
          marcaIdFromName(marca), modello);
      tipoController.text = tipo.nome;
      availableTipos.clear();
      availableTipos.add(tipo);
    }
  }

  String? marcaValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).insertBrand;
    }
    return null;
  }

  String? modelloValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(Get.context!).insertModel;
    }
    return null;
  }

  String? annoValidator(String? value) {
    /* if (value == null || value.isEmpty) {
      return S.of(Get.context!).insertYear;
    } */
    return null;
  }

  String? luogoValidator(String? value) {
    // if (value == null || value.isEmpty) {
    //   return S.of(context).insertLocation;
    // }
    return null;
  }

  String? descrizioneValidator(String? value) {
    /*  if (value == null || value.isEmpty) {
      return 'Inserisci la descrizione';
    } */
    return null;
  }

  String? cvValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci i CV';
    }
    return null;
  }

  String? ccValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci la cilindrata';
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
      'cv': cvController.text.trim(),
      'cc': ccController.text.trim(),
    };
  }

  int tipoIdFromName(String nome) {
    List<TipoMoto> tipi =
        availableTipos.where((tipo) => tipo.nome == nome).toList();
    if (tipi.isEmpty) {
      throw Exception("Tipi is empty!");
    } else {
      return tipi.first.id;
    }
  }

  int marcaIdFromName(String nome) {
    List<MarcaMoto> marche =
        availableMarche.where((marca) => marca.nome == nome).toList();
    if (marche.isEmpty) {
      return -1;
      //throw Exception("Marche is empty!");
    } else {
      return marche.first.id;
    }
  }

  void clear() {
    marcaController.text = "";
    modelloController.text = "";
    tipoController.text = "";
    annoController.text = "";
    luogoController.text = "";
    descrizioneController.text = "";
    cvController.text = "";
    ccController.text = "";
  }
}
