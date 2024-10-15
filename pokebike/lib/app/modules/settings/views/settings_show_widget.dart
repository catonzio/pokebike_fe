import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/settings/views/language_selection_widget.dart';
import 'package:pokebike/app/modules/settings/views/profile_container.dart';
import 'package:pokebike/app/modules/settings/views/settings_button.dart';
import 'package:pokebike/app/shared/widgets/utils/mswitcher.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/settings_controller.dart';

class SettingsShowWidget extends GetView<SettingsController> {
  const SettingsShowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: context.height * 0.62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx(() => Skeletonizer(
                  enabled: controller.user.value == null,
                  child: controller.user.value != null
                      ? ProfileContainer(
                          imagePath: controller.user.value!.avatar,
                          name: fullName(controller.user.value!),
                          onPressed: () => controller.editing = true,
                        )
                      : const SizedBox.shrink(),
                )),
            SizedBox(
              height: context.height * 0.43,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SettingsButton(
                      text: 'changePassword'.tr,
                      iconName: "Password",
                      onPressed: () => controller.editingPassword = true,
                      trailing: const Icon(Icons.arrow_forward_ios)),
                  SettingsButton(
                    text: 'notifications'.tr,
                    iconName: "Notification",
                    trailing: Obx(() => MSwitcherOld(
                          value: controller.notificationsEnabled.value,
                          onChanged: (bool value) async {
                            print("Changed: ");
                            return await controller.openNotificationsSettings();
                          },
                        )),
                  ),
                  SettingsButton(
                      text: 'privacyPolicy'.tr,
                      iconName: "Policy",
                      onPressed: () {
                        launchUrl(Uri.parse(Constants.iubendaUrl));
                      },
                      trailing: const Icon(Icons.arrow_forward_ios)),
                  const LanguageSelectionWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
