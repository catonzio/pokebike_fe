import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/data/models/marca_moto/marca_moto.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:moto_hunters/app/modules/moto-details/moto_details_arguments.dart';
import 'package:moto_hunters/app/shared/controllers/tipo_marca_controller.dart';
import 'package:moto_hunters/app/shared/extensions/date_utils.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';
import 'package:moto_hunters/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';
import 'package:moto_hunters/app/shared/utils/image_compress_helper.dart';

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
  final TextEditingController cvController = TextEditingController();
  final TextEditingController ccController = TextEditingController();
  final RxBool isGarage = false.obs;

  final RxList<XFile> galleryImages = <XFile>[].obs;
  final RxList<int> existingPhotosToKeep = <int>[].obs;

  // Ordinamento immagini
  final RxList<ApiMedia> orderedPhotos = <ApiMedia>[].obs;
  // Lista mista che rappresenta l’ordine effettivo mostrato in UI
  final RxList<dynamic> mixedPhotos = <dynamic>[].obs;
  final RxBool orderChanged = false.obs;

  final RxList<Moto> _myMotos = <Moto>[].obs;
  bool _hasLoadedMyMotos = false;

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
      existingPhotosToKeep.addAll(moto!.photos.map((p) => p.id));
      orderedPhotos.assignAll(moto!.photos);
      // Inizializza mixedPhotos con foto esistenti + nuove foto
      mixedPhotos.clear();
      mixedPhotos.addAll([...orderedPhotos, ...galleryImages]);
      isFavorita.value = moto!.isFavorita;
      marcaController.text = moto!.marcaMoto.nome;
      modelloController.text = moto!.nome;
      tipoController.text = moto!.tipoMoto.nome;
      annoController.text = moto!.anno == null ? '' : moto!.anno.toString();
      dataController.text = moto!.dataCattura.toFormattedString();
      luogoController.text = moto!.luogo;
      descrizioneController.text = moto!.descrizione;
      cvController.text = moto!.cv.toString();
      ccController.text = moto!.cc.toString();
      isGarage.value = moto!.isGarage;
    }
  }

  void initialize(MotoDetailsArguments? arguments) {
    collezioneMoto = arguments?.collezioneMoto;
    moto = arguments?.moto;
    isOwnMoto.value = arguments?.isOwnMoto ?? false;
    canSetFavourite.value = arguments?.canSetFavourite ?? false;

    if (!isOwnMoto.value) {
      _loadMyMotos();
    }
  }

  Future<void> _loadMyMotos() async {
    if (_hasLoadedMyMotos) return;
    _hasLoadedMyMotos = true;
    try {
      final List<Moto> result = await provider.fetchMotos();
      _myMotos
        ..clear()
        ..addAll(result);
    } catch (_) {
      _myMotos.clear();
    }
  }

  bool hasUnlockedSpecsForMoto(Moto motoToShow) {
    if (isOwnMoto.value) {
      return true;
    }
    if (_myMotos.isEmpty) {
      return false;
    }
    return _myMotos.any((m) =>
        m.marcaMoto.id == motoToShow.marcaMoto.id &&
        m.tipoMoto.id == motoToShow.tipoMoto.id &&
        m.nome.toLowerCase() == motoToShow.nome.toLowerCase());
  }

  void toggleShowingInfo({bool? value}) {
    if (value != null) {
      isShowingInfo.value = value;
    } else {
      isShowingInfo.toggle();
    }
  }

  // Riordino misto (foto esistenti + nuove gallery)
  void _syncListsFromMixed() {
    orderedPhotos
      ..clear()
      ..addAll(mixedPhotos.whereType<ApiMedia>());
    galleryImages
      ..clear()
      ..addAll(mixedPhotos.whereType<XFile>());
  }

  // Metodo helper per sincronizzare mixedPhotos dalle liste separate
  void _syncMixedFromLists() {
    mixedPhotos
      ..clear()
      ..addAll([...orderedPhotos, ...galleryImages]);
  }

  void reorderMixedPhotos(int oldIndex, int newIndex) {
    // Controlli di sicurezza per evitare RangeError
    if (mixedPhotos.isEmpty) {
      log('mixedPhotos è vuota, impossibile riordinare');
      return;
    }

    if (oldIndex < 0 || oldIndex >= mixedPhotos.length) {
      log('oldIndex $oldIndex fuori range (0-${mixedPhotos.length - 1})');
      return;
    }

    if (newIndex < 0) {
      newIndex = 0;
    }
    if (newIndex >= mixedPhotos.length) {
      newIndex = mixedPhotos.length - 1;
    }

    // Se gli indici sono uguali, non fare nulla
    if (oldIndex == newIndex) {
      return;
    }

    if (newIndex > oldIndex) newIndex -= 1;

    log('Riordinamento: da $oldIndex a $newIndex, lista ha ${mixedPhotos.length} elementi');

    // Rimuovi l'elemento dall'indice vecchio e inseriscilo nel nuovo
    final dynamic item = mixedPhotos.removeAt(oldIndex);
    mixedPhotos.insert(newIndex, item);

    _syncListsFromMixed();
    orderChanged.value = true;

    log('Riordinamento completato: ${mixedPhotos.length} elementi nella lista mista');
  }

  void reorderExistingPhoto(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final ApiMedia item = orderedPhotos.removeAt(oldIndex);
    orderedPhotos.insert(newIndex, item);
    orderChanged.value = true;
  }

  void toggleEditingMoto({bool? value}) async {
    if (value != null) {
      isEditingMoto.value = value;
    } else {
      isEditingMoto.toggle();
    }

    // Reset del form quando si inizia l'editing per evitare GlobalKey duplicato
    if (isEditingMoto.value) {
      // Non scarichiamo più le foto esistenti: il backend gestirà existing_ids
      // Forza la ricreazione del widget form
      update();
    } else {
      // Pulisci la gallery quando si esce dall'editing
      galleryImages.clear();
    }
  }

  Future<void> _loadExistingPhotosToGallery() async {
    // Scarica le foto già presenti sulla moto e aggiungile alla gallery in modo
    // che vengano reinviate durante il salvataggio. Questo evita di perdere
    // le foto precedenti quando il backend sostituisce completamente la media collection.
    if (moto == null || moto!.photos.isEmpty) return;

    log('Scaricamento foto esistenti (${moto!.photos.length})');

    for (final media in moto!.photos) {
      try {
        final String downloadUrl = media.url.contains('localhost')
            ? media.url.replaceAll('localhost:8080', '10.0.2.2:8080')
            : media.url;
        final response = await provider.httpClient.get(downloadUrl);
        if (response.statusCode == 200) {
          Uint8List bytes;
          if (response.body is Uint8List) {
            bytes = response.body as Uint8List;
          } else if (response.body is List<int>) {
            bytes = Uint8List.fromList(response.body as List<int>);
          } else {
            log('Formato risposta inatteso per ${media.url}');
            continue;
          }
          final Uri uri = Uri.parse(downloadUrl);
          final String name =
              '${media.id}_${uri.pathSegments.isNotEmpty ? uri.pathSegments.last : 'photo.jpg'}';
          final XFile xfile =
              XFile.fromData(bytes, name: name, mimeType: 'image/jpeg');
          galleryImages.add(xfile);
          mixedPhotos.add(xfile);
          log('Aggiunta foto esistente: $name');
        } else {
          log('Impossibile scaricare ${downloadUrl} (status ${response.statusCode})');
        }
      } catch (e) {
        log('Errore download ${media.url}: $e');
      }
    }
  }

  void takePhotoFromGallery(BuildContext context) async {
    if (galleryImages.length >= 5) {
      Get.snackbar('',
          'Hai raggiunto il limite di 5 foto. Elimina una per aggiungerne una nuova.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      galleryImages.add(image);
      _syncMixedFromLists(); // Sincronizza mixedPhotos
    }
  }

  Future<void> makePhoto(BuildContext context) async {
    // Verifica limite foto
    if (galleryImages.length >= 5) {
      Get.snackbar('',
          'Hai raggiunto il limite di 5 foto. Elimina una per aggiungerne una nuova.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        galleryImages.add(image);
        _syncMixedFromLists(); // Sincronizza mixedPhotos
      }
    } catch (e) {
      Get.snackbar('Errore', 'Impossibile scattare la foto: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void showPhotoActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Scatta foto'),
                onTap: () {
                  Navigator.pop(context);
                  makePhoto(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Scegli dalla galleria'),
                onTap: () {
                  Navigator.pop(context);
                  takePhotoFromGallery(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void removeGalleryImage(int index) {
    // Prevenzione rimozione ultima foto
    if (orderedPhotos.length + galleryImages.length <= 1) {
      Get.snackbar('', 'È richiesta almeno una foto della moto',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (index >= 0 && index < galleryImages.length) {
      galleryImages.removeAt(index);
      _syncMixedFromLists(); // Sincronizza mixedPhotos
    }
  }

  void removeExistingPhoto(int photoId) {
    // Prevenzione rimozione ultima foto
    if (orderedPhotos.length + galleryImages.length <= 1) {
      Get.snackbar('', 'È richiesta almeno una foto della moto',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    existingPhotosToKeep.remove(photoId);
    orderedPhotos.removeWhere((photo) => photo.id == photoId);
    _syncMixedFromLists(); // Sincronizza mixedPhotos
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
    /*  if (value == null || value.isEmpty) {
      return S.of(Get.context!).insertLocation;
    } */
    return null;
  }

  String? descrizioneValidator(String? value) {
    /* if (value == null || value.isEmpty) {
      return 'Inserisci la descrizione';
    } */
    return null;
  }

  Map<String, dynamic> getData() {
    return {
      'marca': marcaController.text.trim(),
      'nome': modelloController.text.trim(),
      'tipo': tipoController.text.trim(),
      'anno':
          annoController.text.trim().isEmpty ? '' : annoController.text.trim(),
      'luogo': luogoController.text.trim(),
      'descrizione': descrizioneController.text.trim(),
      'is_garage': isGarage.value,
      /*  'cv': cvController.text.trim(),
      'cc': ccController.text.trim(), */
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
    // Verifica presenza moto
    if (moto == null) {
      return ApiResponse.error(
          message: S.of(Get.context!).noInternet, data: null);
    }

    // Deve rimanere almeno una foto complessiva
    if (existingPhotosToKeep.isEmpty && galleryImages.isEmpty) {
      return ApiResponse.error(
          message: 'È richiesta almeno una foto della moto', data: null);
    }

    isSendingData.value = true;

    // 1. Aggiorna i dati testuali della moto (senza immagini)
    final Map<String, dynamic> updateData = getData();
    ApiResponse baseResponse = await provider.updateMoto(moto!.id, updateData);

    if (!baseResponse.success) {
      isSendingData.value = false;
      return baseResponse;
    }

    // 2. Elimina le foto deselezionate
    final Set<int> originalIds = moto!.photos.map((p) => p.id).toSet();
    final Set<int> toKeep = existingPhotosToKeep.toSet();
    final Set<int> toDelete = originalIds.difference(toKeep);

    for (final int photoId in toDelete) {
      await provider.deleteMotoImage(moto!.id, photoId);
    }

    // 3. Aggiungi le nuove immagini singolarmente (compressione prima dell'upload)
    // Mantieni l'ordine di caricamento seguendo l'ordine in mixedPhotos
    for (final XFile img in galleryImages) {
      final XFile compressed = await compressImage(img);
      await provider.addMotoImage(moto!.id, compressed);
    }

    // 4. Ricarica la moto aggiornata per riflettere i cambiamenti
    final Moto? refreshed = await provider.fetchMoto(moto!.id);
    if (refreshed != null) {
      moto = refreshed;
      // Aggiorna gli ID delle foto esistenti includendo quelle appena caricate
      existingPhotosToKeep
        ..clear()
        ..addAll(moto!.photos.map((p) => p.id));
    }

    // 5. SOLO ORA ordina le foto usando l'ordine scelto dall'utente in mixedPhotos
    if (orderChanged.value && mixedPhotos.length > 1) {
      log('Ordinamento richiesto. mixedPhotos.length: ${mixedPhotos.length}');

      // Costruisci lista ID seguendo la sequenza scelta dall'utente in mixedPhotos
      final List<int> order = [];

      // Mappa ogni elemento di mixedPhotos al suo ID nella moto aggiornata
      for (final element in mixedPhotos) {
        if (element is ApiMedia) {
          // Foto esistente - usa l'ID direttamente se è ancora presente
          if (moto!.photos.any((p) => p.id == element.id)) {
            order.add(element.id);
          }
        } else if (element is XFile) {
          // Nuova foto - trova l'ApiMedia corrispondente nella moto aggiornata
          // Uso l'indice nell'ordine di upload come fallback
          final int xFileIndex =
              galleryImages.indexWhere((img) => img.path == element.path);
          if (xFileIndex != -1) {
            // Trova le foto che non erano presenti prima del refresh
            final Set<int> newPhotoIds =
                moto!.photos.map((p) => p.id).toSet().difference(toKeep);
            final List<int> newPhotoIdsList = newPhotoIds.toList()..sort();

            if (xFileIndex < newPhotoIdsList.length) {
              order.add(newPhotoIdsList[xFileIndex]);
            }
          }
        }
      }

      log('Ordine calcolato: $order, moto.photos.length: ${moto!.photos.length}');

      // Applica l'ordinamento solo se abbiamo tutti gli ID
      if (order.length == moto!.photos.length && order.isNotEmpty) {
        final ApiResponse orderResp =
            await provider.orderMotoImages(moto!.id, order);
        if (orderResp.success) {
          log('Ordinamento applicato con successo');
          orderChanged.value = false;

          // Ricarica la moto per riflettere il nuovo ordine
          final Moto? finalRefresh = await provider.fetchMoto(moto!.id);
          if (finalRefresh != null) {
            moto = finalRefresh;
            orderedPhotos.assignAll(moto!.photos);
            _syncMixedFromLists(); // Sincronizza mixedPhotos con il nuovo ordine
          }
        } else {
          log('Errore durante l\'ordinamento: ${orderResp.message}');
          // In caso di errore ripristina orderedPhotos
          orderedPhotos.assignAll(moto!.photos);
          _syncMixedFromLists();
        }
      } else {
        log('Impossibile ordinare: order.length=${order.length}, photos.length=${moto!.photos.length}');
        // Ripristina l'ordine originale
        orderedPhotos.assignAll(moto!.photos);
        _syncMixedFromLists();
      }
    }

    // Pulisci stato locale
    galleryImages.clear();
    _syncMixedFromLists(); // Sincronizza dopo la pulizia
    isSendingData.value = false;
    return baseResponse;
  }

  Future<ApiResponse> setFavorita() async {
    if (moto != null) {
      final ApiResponse response = await provider.setFavorita(moto!.id);
      isFavorita.value = true;
      moto = moto?.copyWith(isFavorita: true);
      return response;
    } else {
      return ApiResponse.error(
          message: S.of(Get.context!).noInternet, data: null);
    }
  }
}
