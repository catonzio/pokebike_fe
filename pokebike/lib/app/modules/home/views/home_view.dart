import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        body: Center(
      child: ListView(
        children: [
          for (int i = 0; i < 100; i++)
            Container(
              color: Colors.green,
              child: const Text("Hello"),
            )
        ],
      ),
    ));
  }
}
