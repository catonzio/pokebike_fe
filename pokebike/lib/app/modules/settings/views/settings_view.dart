import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/settings/views/settings_edit_password_widget.dart';
import 'package:moto_hunters/app/modules/settings/views/settings_edit_widget.dart';
import 'package:moto_hunters/app/modules/settings/views/settings_show_widget.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/back_button.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        appBar: AppBar(
          title: ShimmerTitle.light(text: 'profile'.tr),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          leading: MBackButton(
            onPressed: () => context.navigator.pop(),
          ),
        ),
        body: Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.editingPassword
                  ? const SettingsEditPasswordWidget()
                  : controller.editing
                      ? const SettingsEditWidget()
                      : const SettingsShowWidget(),
            )));
  }
}
