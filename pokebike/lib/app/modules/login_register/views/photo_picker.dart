import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';

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
              onTap: () => _selectAvatar(context),
              child: Container(
                height: context.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: MColors.secondary, width: 3),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
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
            height: context.height * 0.3,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('whereSelectImg'.tr),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MButton(
                                label: 'camera'.tr,
                                onTap: () =>
                                    context.navigator.pop(ImageSource.camera)),
                          )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MButton(
                                label: 'gallery'.tr,
                                onTap: () =>
                                    context.navigator.pop(ImageSource.gallery)),
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

  _selectAvatar(BuildContext context) async {
    final ImageSource? source = await _selectImageSource(context);
    if (source != null) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        print(image.path);
        onSuccess(image);
        // controller.avatar = image.path;
      }
    }
  }
}
