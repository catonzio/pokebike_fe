import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_register_controller.dart';

class LoginRegisterView extends GetView<LoginRegisterController> {
  
  const LoginRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginRegisterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginRegisterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
