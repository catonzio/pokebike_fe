import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/back_button.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShimmerTitle.light(text: "Profilo"),
        centerTitle: true,
        leading: MBackButton(
          onPressed: () => context.navigator.pop(),
        ),
      ),
      body: const Center(
        child: Text(
          'SettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
