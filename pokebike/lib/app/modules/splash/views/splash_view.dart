import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/routes/app_pages.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.PRESENTATION);
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
