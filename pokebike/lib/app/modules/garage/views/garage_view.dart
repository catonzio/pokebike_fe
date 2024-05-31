import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/garage_controller.dart';

class GarageView extends GetView<GarageController> {
  const GarageView({super.key});
  @override
  Widget build(BuildContext context) {
    return const DefaultPage(
      body: Center(
        child: Text(
          'GarageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
