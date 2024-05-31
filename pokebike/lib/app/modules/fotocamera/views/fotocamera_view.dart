import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/fotocamera_controller.dart';

class FotocameraView extends GetView<FotocameraController> {
  const FotocameraView({super.key});
  @override
  Widget build(BuildContext context) {
    return const DefaultPage(
        body: Center(
      child: Text(
        'Camera is working',
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
