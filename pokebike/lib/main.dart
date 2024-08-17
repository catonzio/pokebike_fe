import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/config/themes.dart';
import 'package:pokebike/app/shared/bindings/initial_bindings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/routes/app_pages.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  await GetStorage.init(Constants.settingsStorage);
  cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle()
      .load('assets/ca/danilocatone.com_ssl_certificate.cer');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pokebike",
      debugShowCheckedModeBanner: false,
      theme: Themes.dark(),
      locale: const Locale('it'), //Get
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('it'),
      ],
      defaultTransition: Transition.size,
      transitionDuration: const Duration(milliseconds: 300),
      initialBinding: InitialBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
