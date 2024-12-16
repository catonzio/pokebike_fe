import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';

Future<ImageSource?> selectImageSource(BuildContext context) async {
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

Future<XFile?> selectAvatar(BuildContext context, {ImageSource? source}) async {
  source = source ?? await selectImageSource(context);
  // final ImageSource? source = await selectImageSource(context);
  if (source != null) {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      print(image.path);
      return image;
      // controller.avatar = image.path;
    }
  }
  return null;
}
