import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:pokebike/app/data/models/marca_moto/marca_moto.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:pokebike/app/modules/moto-details/moto_details_arguments.dart';
import 'package:pokebike/app/shared/controllers/tipo_marca_controller.dart';
import 'package:pokebike/app/shared/extensions/date_utils.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

class MotoDetailsController extends GetxController {
  MotoDetailsArguments arguments = Get.arguments as MotoDetailsArguments;
  final Rxn<CollezioneMoto> _collezioneMoto = Rxn<CollezioneMoto>();
  CollezioneMoto? get collezioneMoto => _collezioneMoto.value;
  set collezioneMoto(CollezioneMoto? value) => _collezioneMoto.value = value;

  final Rxn<Moto> _moto = Rxn<Moto>();
  Moto? get moto => _moto.value;
  set moto(Moto? value) => _moto.value = value;

  final RxBool isOwnMoto = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxList<TipoMoto> availableTipos = <TipoMoto>[].obs;
  final RxList<MarcaMoto> availableMarche = <MarcaMoto>[].obs;

  final RxBool isShowingInfo = false.obs;
  final RxBool isEditingMoto = false.obs;

  final RxBool isFavorita = false.obs;

  final RxBool isSendingData = false.obs;

  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modelloController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController annoController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController luogoController = TextEditingController();
  final TextEditingController descrizioneController = TextEditingController();

  final MotoProvider provider;

  MotoDetailsController({required this.provider});

  @override
  void onInit() {
    final TipoMarcaController tipoMarcaController = TipoMarcaController.to;
    availableTipos.addAll(tipoMarcaController.tipi);
    availableMarche.addAll(tipoMarcaController.marche);

    if (moto != null) {
      isFavorita.value = moto!.isFavorita;
      marcaController.text = moto!.marcaMoto.nome;
      modelloController.text = moto!.nome;
      tipoController.text = moto!.tipoMoto.nome;
      annoController.text = moto!.anno.toString();
      dataController.text = moto!.dataCattura.toFormattedString();
      luogoController.text = moto!.luogo;
      descrizioneController.text = moto!.descrizione;
    }
    super.onInit();
    initialize(arguments);
  }

  void initialize(MotoDetailsArguments? arguments) {
    collezioneMoto = arguments?.collezioneMoto;
    moto = arguments?.moto;
    isOwnMoto.value = arguments?.isOwnMoto ?? false;
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
      // 'data_cattura': DateTime.fromFormattedString(dataController.text.trim()),
      // DateTime.tryParse(dataController.text.trim().replaceAll("/", "-"))
      //         ?.toIso8601String() ??
      //     dataController.text.trim().replaceAll("/", "-"),
      'marca_moto_id': availableMarche
          .where((MarcaMoto p0) => p0.nome == marcaController.text.trim())
          .first
          .id,
      'tipo_moto_id': availableTipos
          .where((TipoMoto p0) => p0.nome == tipoController.text.trim())
          .first
          .id,
    };
  }

  annullaEdit() {
    toggleEditingMoto(value: false);
  }

  Future<ApiResponse> salva() async {
    if (moto == null) {
      return ApiResponse.error(message: 'noInternet'.tr, data: null);
    }
    isSendingData.value = true;
    final ApiResponse response = await provider.updateMoto(moto!.id, getData());
    isSendingData.value = false;
    return response;
  }

  Future<ApiResponse> setFavorita() async {
    if (moto != null) {
      final ApiResponse response = await provider.setFavorita(moto!.id);
      isFavorita.value = true;
      moto = moto?.copyWith(isFavorita: true);
      return response;
    } else {
      return ApiResponse.error(message: 'noInternet'.tr, data: null);
    }
  }
}
