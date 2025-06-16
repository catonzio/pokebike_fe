import 'dart:typed_data';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/add_moto_form.dart';
import 'package:moto_hunters/app/modules/garage/controllers/garage_w_controller.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/widgets/default_dialog.dart';
import 'package:moto_hunters/app/shared/widgets/utils/loading_stack.dart';

import '../controllers/fotocamera_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

Future<Image> xFileToImage(XFile xFile) async {
  final Uint8List bytes = await xFile.readAsBytes();
  return Image.memory(bytes);
}

class AddMotoView extends GetView<FotocameraController> {
  const AddMotoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingStack(
        isLoading: controller.isUploadingMoto,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              expandedHeight: Get.context!.height * 0.4,
              snap: false,
              pinned: false,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(background: _showImage(context)),
            ),
            SliverToBoxAdapter(
              child: Obx(() {
                final count = controller.galleryImages.length;
                if (count == 0 && count >= 5) return const SizedBox.shrink();
                final showAdd = count < 5;
                final total = count + (showAdd ? 1 : 0);
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: total,
                    itemBuilder: (context, index) {
                      if (index < count) {
                        final file = controller.galleryImages[index];
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(File(file.path),
                                    width: 100, height: 100, fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.removeGalleryImage(index),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.close,
                                        size: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: GestureDetector(
                            onTap: () {
                              controller.showPhotoActionSheet(context);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.add_a_photo,
                                  size: 30, color: Colors.black54),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              }),
            ),
            SliverPadding(
              padding:
                  EdgeInsets.only(bottom: Get.context!.keyboardHeight / 1.5),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          center: Alignment.bottomCenter,
                          radius: 2,
                          colors: [
                        MColors.secondary.withValues(alpha: 0.3),
                        Colors.black
                      ])),
                  child: AddMotoForm(
                    onStartEndSend: (bool value) =>
                        controller.isUploadingMoto.value = value,
                    onSend: (data) => _sendMoto(context, data),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _showImage(BuildContext context) {
    return Container(
      height: Get.context!.height * 0.4,
      width: Get.context!.width,
      color: MColors.primaryDark,
      child: Obx(() {
        // Se ci sono immagini caricate, mostra la gallery
        if (controller.galleryImages.isNotEmpty) {
          // Converte XFile in ApiMedia per la compatibilità con ImageGallery
          List<ApiMedia> galleryApiMedia =
              controller.galleryImages.map((xfile) {
            return ApiMedia(
              id: controller.galleryImages.indexOf(xfile),
              url: xfile.path, // Uso il path locale
            );
          }).toList();

          return Stack(
            children: [
              // Usa una versione modificata della gallery per file locali
              PageView.builder(
                itemCount: galleryApiMedia.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(controller.galleryImages[index].path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        // Pulsante elimina - solo se ci sono più di una immagine
                        if (controller.galleryImages.length > 1)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () => controller.removeGalleryImage(index),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        // Indicatore posizione
                        if (galleryApiMedia.length > 1)
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${index + 1}/${galleryApiMedia.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        }

        // Fallback alla singola immagine se presente
        if (controller.image != null) {
          return FutureBuilder(
            future: xFileToImage(controller.image!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image(
                  image: ResizeImage((snapshot.data as Image).image,
                      width: 1080, height: 1080),
                  fit: BoxFit.cover,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        }

        // Placeholder quando non ci sono immagini - migliore UX
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[700]!, width: 2),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'Aggiungi la prima immagine',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'È richiesta almeno una foto',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<bool> _sendMoto(
      BuildContext context, Map<String, dynamic> data) async {
    // Verifica che ci sia almeno una immagine
    if (controller.galleryImages.isEmpty && controller.image == null) {
      Get.context!.createSnackbar('È richiesta almeno una foto della moto');
      return false;
    }

    bool? exists = await _checkIfExists(context, data);

    if (Get.context!.mounted) {
      if (exists != null && exists) {
        bool? result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: DefaultDialog(
                  title: S.of(context).motoAlreadyInserted,
                  message: S.of(context).motoAlreadyInsertedSubtitle,
                  redTitle: S.of(context).substitute,
                  redAction: (context) {
                    _addMoto(context, data);
                    Get.context!.navigator.pop(true);
                  },
                  whiteTitle: S.of(context).nullify,
                  whiteAction: (context) => Get.context!.navigator.pop(false)),
            );
          },
        );

        return result == true; // return true if redAction was triggered
      } else {
        return _addMoto(context, data);
      }
    }
    return false;
  }

  Future<bool> _addMoto(BuildContext context, Map<String, dynamic> data) async {
    data['images'] = controller.galleryImages;

    ApiResponse response = await controller.addMoto(data);
    if (Get.context!.mounted) {
      handleApiResponse(context, response,
          successMessage: S.of(context).motoSaved, onSuccess: (dynamic data) {
        controller.isCapturing = true;
        if (Get.isRegistered<GarageWController>()) {
          GarageWController.to.list.add(Moto.fromJson(data));
        }
      });
    }
    return response.success;
  }

  Future<bool?> _checkIfExists(
      BuildContext context, Map<String, dynamic> data) async {
    ApiResponse response = await controller.checkMotoDuplicate(data);
    if (response.success) {
      return response.data as bool;
    } else {
      if (Get.context!.mounted) {
        Get.context!.createSnackbar(S.of(context).noInternet);
      }
    }
    return null;
  }
}
