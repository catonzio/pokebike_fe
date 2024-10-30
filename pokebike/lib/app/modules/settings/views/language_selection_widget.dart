import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/controllers/settings_controller.dart';
import 'package:pokebike/app/modules/settings/views/settings_button.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class LanguageSelectionWidget extends GetView<SettingsController> {
  const LanguageSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsButton(
        text: 'chooseLanguage'.tr,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.language,
            size: 20,
            color: Colors.white,
          ),
        ),
        trailing: DropdownButton<Locale>(
          value: Get.locale,
          items: const [
            DropdownMenuItem(value: Locale('en'), child: Text("English")),
            DropdownMenuItem(value: Locale('it'), child: Text("Italian")),
            DropdownMenuItem(value: Locale('es'), child: Text("Spanish")),
            DropdownMenuItem(value: Locale('fr'), child: Text("French")),
          ],
          onChanged: (locale) async {
            if (locale != null) {
              bool result = await controller.updateLocale(locale);
              if (context.mounted) {
                context.createSnackbar(
                    result ? 'updatedLanguage'.tr : 'nonUpdatedLanguage'.tr);
              }
            }
          },
          underline: const SizedBox.shrink(),
        ));
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text('chooseLanguage'.tr),
    //       ,
    //     ],
    //   ),
    // );
  }
}
