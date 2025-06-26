import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';
import 'package:moto_hunters/app/shared/widgets/utils/image_picker.dart';
import 'package:moto_hunters/app/shared/utils/image_compress_helper.dart';
import 'package:moto_hunters/generated/l10n.dart';
import 'package:moto_hunters/initializer.dart';

class FotocameraController extends GetxController {
  final RxInt _selectedIndex = 1.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;

  final RxBool _isInitialized = false.obs;
  bool get isInitialized => _isInitialized.value;
  set isInitialized(bool value) => _isInitialized.value = value;

  final RxBool _isCapturing = true.obs;
  bool get isCapturing => _isCapturing.value;
  set isCapturing(bool value) => _isCapturing.value = value;

  final RxBool isUploadingMoto = false.obs;
  final RxList<XFile> galleryImages = <XFile>[].obs;

  final ScrollController scrollController = ScrollController();

  late final CameraController? cameraController;
  late final bool cameraError;

  final Rx<XFile?> _image = Rx<XFile?>(null);
  XFile? get image => _image.value;
  set image(XFile? value) => _image.value = value;

  final MotoProvider provider;

  FotocameraController(this.provider) {
    if (cameras.isEmpty) {
      cameraError = true;
      cameraController = null;
    } else {
      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.max,
        enableAudio: false,
      );
      cameraError = false;
    }
  }

  @override
  Future<void> onInit() async {
    // cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController
        ?.initialize()
        .then((value) => isInitialized = true)
        .onError((error, stackTrace) {
      print(error);
      return false;
    });
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isCapturing = true;
      } else {
        isCapturing = false;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    scrollController.dispose();
    super.onClose();
  }

  makePhoto(BuildContext context) async {
    // Verifica limite foto
    if (galleryImages.length >= 5) {
      Get.snackbar('',
          'Hai raggiunto il limite di 5 foto. Elimina una per aggiungerne una nuova.',
          snackPosition: SnackPosition.BOTTOM);
      isCapturing = false;
      return;
    }
    try {
      final XFile? photo = await cameraController?.takePicture();
      if (photo != null) {
        image = photo;
        galleryImages.add(photo);
      }
    } catch (e) {
      final ImagePicker picker = ImagePicker();
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        image = picked;
        galleryImages.add(picked);
      }
    }
    isCapturing = false;
  }

  void takePhotoFromGallery(BuildContext context) async {
    if (galleryImages.length >= 5) {
      Get.snackbar('',
          'Hai raggiunto il limite di 5 foto. Elimina una per aggiungerne una nuova.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    final XFile? picked =
        await selectAvatar(context, source: ImageSource.gallery);
    if (picked != null) {
      galleryImages.add(picked);
      image = picked;
      isCapturing = false;
    }
  }

  void reorderGalleryImage(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final XFile item = galleryImages.removeAt(oldIndex);
    galleryImages.insert(newIndex, item);
    // Aggiorna l'immagine principale per coerenza UI
    if (galleryImages.isNotEmpty) {
      image = galleryImages.first;
    }
  }

  void removeGalleryImage(int index) {
    // Non permettere di rimuovere l'ultima immagine rimasta
    if (galleryImages.length <= 1) {
      return;
    }
    galleryImages.removeAt(index);

    // Se non ci sono più immagini nella gallery, imposta l'ultima come image principale
    if (galleryImages.isNotEmpty) {
      image = galleryImages.last;
    }
  }

  Future<ApiResponse> addMoto(Map<String, dynamic> data) async {
    // isUploadingMoto.value = true;
    if (!data.containsKey('is_garage')) {
      data['is_garage'] = selectedIndex == 0;
    }
    // Estrai eventuali immagini dal payload
    List<XFile> images = [];
    if (data.containsKey('images')) {
      final dynamic imgs = data.remove('images');
      if (imgs is List<XFile>) {
        images = imgs;
      }
    }

    final ApiResponse result = await provider.addMoto(data);

    // Se la creazione ha avuto successo e ci sono immagini, inviale singolarmente
    if (result.success && result.data != null && images.isNotEmpty) {
      final int motoId = (result.data as Map)['id'] as int;
      for (final XFile img in images) {
        final XFile compressed = await compressImage(img);
        await provider.addMotoImage(motoId, compressed);
      }
    }
    // isUploadingMoto.value = false;
    return result;
  }

  void showPhotoActionSheet(BuildContext context) {
    if (galleryImages.length >= 5) {
      Get.snackbar('',
          'Hai raggiunto il limite di 5 foto. Elimina una per aggiungerne una nuova.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(S.of(context).photocamera),
                onTap: () async {
                  Navigator.pop(ctx);
                  final XFile? picked =
                      await selectAvatar(context, source: ImageSource.camera);
                  if (picked != null) {
                    galleryImages.add(picked);
                    image = picked;
                    isCapturing = false;
                  }
                },
              ),
              ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.photo_library),
                    if (selectedIndex != 0)
                      const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Icon(Icons.lock, size: 16),
                      ),
                  ],
                ),
                title: Text(S.of(context).gallery),
                enabled: true,
                onTap: () async {
                  if (selectedIndex != 0) {
                    Get.snackbar('', S.of(context).galleryLockedMessage,
                        snackPosition: SnackPosition.BOTTOM);
                    return;
                  }
                  Navigator.pop(ctx);
                  final XFile? picked =
                      await selectAvatar(context, source: ImageSource.gallery);
                  if (picked != null) {
                    galleryImages.add(picked);
                    image = picked;
                    isCapturing = false;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<ApiResponse> checkMotoDuplicate(Map<String, dynamic> data) async {
    final ApiResponse result = await provider.checkMotoDuplicate(
        data['marca_moto_id'], data['tipo_moto_id'], data['nome']);
    return result;
  }
}
