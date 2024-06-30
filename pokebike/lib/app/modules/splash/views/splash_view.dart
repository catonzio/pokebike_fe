import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pokebike/app/modules/splash/controllers/splash_controller.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      PermissionStatus status = await Permission.notification.request();
      print(status);

      bool tokenValid = await SplashController.to.checkToken();
      String route = Routes.PRESENTATION;

      if (tokenValid) {
        route = Routes.HOME;
      } else {
        if (Storage.to.hasSeenPresentation) {
          route = Routes.LOGIN_REGISTER;
        } else {
          route = Routes.PRESENTATION;
        }
      }

      if (context.mounted) {
        context.navigator.pushReplacementNamed(route);
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
