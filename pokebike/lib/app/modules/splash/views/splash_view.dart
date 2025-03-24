import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:moto_hunters/app/modules/splash/controllers/splash_controller.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';
import 'package:moto_hunters/app/shared/controllers/tipo_marca_controller.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/initializer.dart';
import 'package:moto_hunters/messaging.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeApp();
      await _checkPermissions();

      String route = await _checkToken();
      await TipoMarcaController.to.initialize();

      if (mounted) {
        context.navigator.pushReplacementNamed(route);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08080a),
      body: Image.asset(
        "assets/images/splash_old.png",
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

  Future<void> _initializeApp() async {
    final initializer = Initializer();
    await initializer.initialize();

    MessagingInitializer messagingInitialize = MessagingInitializer();
    await messagingInitialize.initialize();
  }

  Future<void> _checkPermissions() async {
    // PermissionStatus status = await Permission.notification.request();
    await Permission.notification.request();
  }

  Future<String> _checkToken() async {
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
    return route;
  }
}
