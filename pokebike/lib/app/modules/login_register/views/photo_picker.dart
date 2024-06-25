import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/config/colors.dart';

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
              onTap: _selectAvatar,
              child: Container(
                height: context.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: MColors.secondary, width: 3),
                ),
                alignment: Alignment.center,
                child: Text(text),
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

  _selectAvatar() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
      onSuccess(image);
      // controller.avatar = image.path;
    }
  }
}
