import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/torneo_controller.dart';

class TorneoView extends GetView<TorneoController> {
  const TorneoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultPage(
        body: Center(
      child: Text(
        'TorneoView is working',
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
