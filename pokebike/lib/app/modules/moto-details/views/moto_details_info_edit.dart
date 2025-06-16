import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/add_moto_form_field.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/add_moto_form_field_model.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/shared/extensions/date_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/widgets/image_gallery.dart';
import 'package:moto_hunters/app/shared/widgets/utils/loading_stack.dart';
import 'dart:io';

import '../controllers/moto_details_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class MotoDetailsInfoEdit extends GetView<MotoDetailsController> {
  const MotoDetailsInfoEdit({super.key});

  @override
  Widget build(BuildContext context) {
    List<MotoFormFieldModel> fields = [
      MotoFormFieldModelDropdown(
          label: S.of(context).brand,
          items: controller.availableMarche
              .map((element) => element.nome)
              .toList(),
          validator: controller.marcaValidator,
          controller: controller.marcaController),
      MotoFormFieldModel(
          label: S.of(context).model,
          validator: controller.modelloValidator,
          controller: controller.modelloController),
      MotoFormFieldModelDropdown(
          label: S.of(context).type,
          items:
              controller.availableTipos.map((element) => element.nome).toList(),
          // validator: controller.tipoValidator,
          controller: controller.tipoController),
      MotoFormFieldModel(
          label: 'CV',
          controller: controller.cvController,
          isNumeric: true,
          readOnly: true),
      MotoFormFieldModel(
          label: 'CC',
          controller: controller.ccController,
          isNumeric: true,
          readOnly: true),
      MotoFormFieldModel(
          label: S.of(context).year,
          validator: controller.annoValidator,
          controller: controller.annoController,
          isNumeric: true),
      MotoFormFieldModel(
          label: S.of(context).location,
          // validator: controller.luogoValidator,
          controller: controller.luogoController),
      MotoFormFieldModel(
          label: S.of(context).description,
          // validator: controller.descrizioneValidator,
          controller: controller.descrizioneController,
          maxLines: 5)
    ];

    return LoadingStack(
        isLoading: controller.isSendingData,
        child: Form(
          key: controller.formKey,
          child: Column(
              // padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
              // itemExtent: Get.context!.height * 0.11,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPhotoSection(context),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(S.of(context).captureDate),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          controller.moto!.dataCattura.toFormattedString(),
                          style: Get.context!.textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                ...fields.map((MotoFormFieldModel e) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: AddMotoFormField(model: e),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: MButton.red(
                    onPressed: () => _salva(context),
                    child: Text(S.of(context).save),
                  ),
                ),
                MButton.white(
                    onPressed: () => controller.annullaEdit(),
                    child: Text(
                      S.of(context).nullify,
                      style: const TextStyle(color: Colors.black),
                    ))
              ]),
        ));
  }

  Widget _buildPhotoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            'Gestione Foto',
            style: Get.context!.textTheme.titleMedium,
          ),
        ),
        Obx(() {
          // Mostra solo le foto esistenti che sono ancora da mantenere
          List<ApiMedia> existingPhotos = controller.moto?.photos
                  .where((photo) =>
                      controller.existingPhotosToKeep.contains(photo.id))
                  .toList() ??
              [];
          int count = existingPhotos.length + controller.galleryImages.length;

          if (count == 0 && count >= 5) return const SizedBox.shrink();
          final showAdd = count < 5;
          final total = count + (showAdd ? 1 : 0);

          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: total,
              itemBuilder: (context, index) {
                // Prima mostra le foto esistenti
                if (index < existingPhotos.length) {
                  final photo = existingPhotos[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: ImageGallery(
                              images: [photo],
                              height: 100,
                              aspectRatio: 1,
                              canReport: false,
                            ),
                          ),
                        ),
                        // Pulsante elimina solo se ci sono più di una foto totale
                        if (count > 1)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () =>
                                  _removePhoto(index, existingPhotos.length),
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
                }
                // Poi mostra le foto dalla gallery
                else if (index < count) {
                  final galleryIndex = index - existingPhotos.length;
                  final file = controller.galleryImages[galleryIndex];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(File(file.path),
                              width: 100, height: 100, fit: BoxFit.cover),
                        ),
                        // Pulsante elimina solo se ci sono più di una foto totale
                        if (count > 1)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () =>
                                  controller.removeGalleryImage(galleryIndex),
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
                }
                // Infine il pulsante "+" per aggiungere
                else {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () => controller.showPhotoActionSheet(context),
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
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'È richiesta almeno una foto',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  void _removePhoto(int index, int existingPhotosCount) {
    if (index < existingPhotosCount) {
      // Rimuovi la foto esistente dalla lista delle foto da mantenere
      List<ApiMedia> existingPhotos = controller.moto!.photos
          .where((photo) => controller.existingPhotosToKeep.contains(photo.id))
          .toList();
      final existingPhoto = existingPhotos[index];
      controller.removeExistingPhoto(existingPhoto.id);
    } else {
      // Rimozione di foto dalla gallery
      int galleryIndex = index - existingPhotosCount;
      controller.removeGalleryImage(galleryIndex);
    }
  }

  Future<void> _salva(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      controller.salva().then((ApiResponse response) => Get.context!.mounted
          ? handleApiResponse(context, response,
              successMessage: S.of(context).dataSaved,
              onSuccess: (_) => controller.isEditingMoto.value = false)
          : null);
    }
  }
}
