import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/mbutton.dart';
import 'package:moto_hunters/generated/l10n.dart';

class PhotoPicker extends StatelessWidget {
  final String text;
  final String? Function(XFile?)? validator;
  final Function(XFile) onSuccess;

  const PhotoPicker(
      {super.key,
      required this.text,
      required this.validator,
      required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return FormField<XFile>(
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _selectAvatar(context, field),
              child: Container(
                height: field.value != null
                    ? Get.context!.width
                    : Get.context!.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: MColors.secondary, width: 3),
                  image: field.value != null
                      ? DecorationImage(
                          image: FileImage(File(field.value!.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                alignment: Alignment.center,
                child: field.value == null
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : null,
              ),
            ),
            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: MColors.error),
                ),
              )
          ],
        );
      },
    );
  }

  Future<ImageSource?> _selectImageSource(BuildContext context) async {
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: Get.context!.height * 0.3,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(S.of(context).whereSelectImg),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MButton(
                                label: S.of(context).camera,
                                onTap: () => Get.context!.navigator
                                    .pop(ImageSource.camera)),
                          )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MButton(
                                label: S.of(context).gallery,
                                onTap: () {
                                  if (false /* Get.currentRoute != Routes.GARAGE */) {
                                    Get.context!.navigator.pop();
                                    Get.snackbar(
                                        '', S.of(context).galleryLockedMessage,
                                        snackPosition: SnackPosition.BOTTOM);
                                  } else {
                                    Get.context!.navigator
                                        .pop(ImageSource.gallery);
                                  }
                                }),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
    return source;
  }

  _selectAvatar(BuildContext context, FormFieldState<XFile> field) async {
    final ImageSource? source = await _selectImageSource(context);
    if (source != null) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        field.didChange(image);
        print(image.path);
        onSuccess(image);
      }
    }
  }
}
