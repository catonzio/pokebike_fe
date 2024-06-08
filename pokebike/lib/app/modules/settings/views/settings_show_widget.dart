import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/views/profile_container.dart';
import 'package:pokebike/app/modules/settings/views/settings_button.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/utils/mswitcher.dart';

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
        height: context.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            ProfileContainer(
              imagePath: MImageProvider.getImageUrl(),
              name: "Nome Cognome",
              onPressed: () => controller.editing = true,
            ),
            SizedBox(
              height: context.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SettingsButton(
                      text: "E-mail e password",
                      icon: "E-mail",
                      onPressed: () {},
                      trailing: const Icon(Icons.arrow_forward_ios)),
                  SettingsButton(
                    text: "Notifiche",
                    icon: "Notification",
                    trailing: MSwitcher(
                      onChanged: (bool value) {
                        print("Changed: $value");
                        controller.openNotificationsSettings();
                      },
                    ),
                  ),
                  SettingsButton(
                      text: "Termini e condizioni",
                      icon: "Policy",
                      onPressed: () {},
                      trailing: const Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
