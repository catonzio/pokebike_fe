import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Storage storage = Storage.to;
      if (storage.apiToken.isEmpty) {
        context.navigator.pushReplacementNamed(Routes.PRESENTATION);
      } else {
        context.navigator.pushReplacementNamed(Routes.HOME);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",
        width: context.width,
        height: context.height,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      // body: SvgPicture.asset(
      //   "assets/images/splash.svg",
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
