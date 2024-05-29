import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
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
      ),
      bottomNavigationBar: const BottomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: CircleBorder(eccentricity: 0.9, side: BorderSide.none),
      //   onPressed: () {},
      //   child: Icon(Icons.camera_alt),
      // ),
    );
  }
}
