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
import 'package:image_picker/image_picker.dart';

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
          // Usa mixedPhotos come lista unica
          int photoCount = controller.mixedPhotos.length;
          
          if (photoCount == 0 && photoCount >= 5) return const SizedBox.shrink();
          final showAdd = photoCount < 5;
          final total = photoCount + (showAdd ? 1 : 0);

          return SizedBox(
            height: 120,
            child: ReorderableListView.builder(
              scrollDirection: Axis.horizontal,
              onReorder: controller.reorderMixedPhotos,
              itemCount: total,
              buildDefaultDragHandles: false,
              itemBuilder: (context, index) {
                // Prima gestisci le foto esistenti e nuove dalla lista mista
                if (index < photoCount) {
                  final item = controller.mixedPhotos[index];
                  
                  // Se è una foto esistente (ApiMedia)
                  if (item is ApiMedia) {
                    return ReorderableDelayedDragStartListener(
                      key: ValueKey('api_${item.id}'),
                      index: index,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 100,
                                height: 100,
                                child: ImageGallery(
                                  images: [item],
                                  height: 100,
                                  aspectRatio: 1,
                                  canReport: false,
                                ),
                              ),
                            ),
                            // Pulsante elimina solo se ci sono più di una foto totale
                            if (photoCount > 1)
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () => _removeExistingPhoto(item.id),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
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
                      ),
                    );
                  }
                  // Se è una nuova foto (XFile)
                  else if (item is XFile) {
                    return ReorderableDelayedDragStartListener(
                      key: ValueKey('xfile_${item.path}'),
                      index: index,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(item.path),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Pulsante elimina solo se ci sono più di una foto totale
                            if (photoCount > 1)
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () => _removeGalleryPhoto(index),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
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
                      ),
                    );
                  }
                }
                // Pulsante "+" per aggiungere
                else {
                  return Padding(
                    key: const ValueKey('add_btn'),
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () => controller.showPhotoActionSheet(context),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }
                
                // Return statement per evitare errore di lint
                return const SizedBox.shrink();
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

  void _removeExistingPhoto(int id) {
    controller.removeExistingPhoto(id);
  }

  void _removeGalleryPhoto(int index) {
    controller.removeGalleryImage(index);
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
