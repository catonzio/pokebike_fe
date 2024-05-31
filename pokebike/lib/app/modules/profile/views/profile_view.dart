import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultPage(
        body: Center(
      child: Text(
        'ProfileView is working',
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
