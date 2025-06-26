import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/mbutton.dart';
import 'package:moto_hunters/generated/l10n.dart';

Future<ImageSource?> selectImageSource(BuildContext context) async {
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
                                if (Get.currentRoute != Routes.GARAGE &&
                                    Get.currentRoute != Routes.PROFILE &&
                                    Get.currentRoute != Routes.SETTINGS) {
                                  Get.back();
                                  Get.snackbar(
                                      '', S.of(context).galleryLockedMessage,
                                      snackPosition: SnackPosition.BOTTOM);
                                } else {
                                  Get.back(result: ImageSource.gallery);
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
