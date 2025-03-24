import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/data/models/marca_moto/marca_moto.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:moto_hunters/app/modules/moto-details/moto_details_arguments.dart';
import 'package:moto_hunters/app/shared/controllers/tipo_marca_controller.dart';
import 'package:moto_hunters/app/shared/extensions/date_utils.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';

class MotoDetailsController extends GetxController {
  MotoDetailsArguments arguments = Get.arguments as MotoDetailsArguments;
  final Rxn<CollezioneMoto> _collezioneMoto = Rxn<CollezioneMoto>();
  CollezioneMoto? get collezioneMoto => _collezioneMoto.value;
  set collezioneMoto(CollezioneMoto? value) => _collezioneMoto.value = value;

  final Rxn<Moto> _moto = Rxn<Moto>();
  Moto? get moto => _moto.value;
  set moto(Moto? value) => _moto.value = value;

  final RxBool isOwnMoto = false.obs;
  final RxBool canSetFavourite = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxList<TipoMoto> availableTipos = <TipoMoto>[].obs;
  final RxList<MarcaMoto> availableMarche = <MarcaMoto>[].obs;

  final RxBool isShowingInfo = true.obs;
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
    super.onInit();
    initialize(arguments);

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
  }

  void initialize(MotoDetailsArguments? arguments) {
    collezioneMoto = arguments?.collezioneMoto;
    moto = arguments?.moto;
    isOwnMoto.value = arguments?.isOwnMoto ?? false;
    canSetFavourite.value = arguments?.canSetFavourite ?? false;
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
      return 'insertBrand'.tr;
    }
    return null;
  }

  String? modelloValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'insertModel'.tr;
    }
    return null;
  }

  String? annoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'insertYear'.tr;
    }
    return null;
  }

  String? luogoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'insertLocation'.tr;
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
    moto = Moto.fromJson(response.data);

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
