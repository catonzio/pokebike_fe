import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/modules/settings/views/settings_edit_widget.dart';
import 'package:pokebike/app/modules/settings/views/settings_show_widget.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/back_button.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        appBar: AppBar(
          title: ShimmerTitle.light(text: "Profilo"),
          centerTitle: true,
          leading: MBackButton(
            onPressed: () => context.navigator.pop(),
          ),
        ),
        body: Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              // transitionBuilder: (child, animation) {
              //   return SlideTransition(
              //     position: Tween<Offset>(
              //       begin: const Offset(-1.0, 0.0),
              //       end: Offset.zero,
              //     ).animate(animation),
              //     child: child,
              //   );
              // },
              child: controller.editing
                  ? const SettingsEditWidget()
                  : const SettingsShowWidget(),
            )));
  }
}
