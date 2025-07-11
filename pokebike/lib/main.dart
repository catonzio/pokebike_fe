import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/translations/app_translations.dart';
import 'package:moto_hunters/app/config/themes.dart';
import 'package:moto_hunters/app/shared/bindings/initial_bindings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moto_hunters/app/shared/controllers/ui_images_controller.dart';
import 'package:moto_hunters/app/shared/providers/ui_images_provider.dart';
import 'package:moto_hunters/app/shared/ads/ad_service.dart';
import 'package:moto_hunters/generated/l10n.dart';

import 'app/routes/app_pages.dart';
import 'dart:developer';
import 'dart:io';
import 'package:moto_hunters/app/config/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inizializza AdMob
  await AdService.initialize(
      testDeviceIds: ['63EFAD8CCA907ACC3B963F9AE1B11537']);
  // inizializza Storage e altri servizi con InitialBindings
  InitialBindings().dependencies();
  if (Constants.isLocal) {
    await _checkLocalBackend();
  }
  // Precarica le UI images prima di avviare l'app così che lo splash abbia già le immagini remote
  final uiImagesController = UIImagesController(provider: UIImagesProvider());
  await uiImagesController.loadAll();
  Get.put(uiImagesController, permanent: true);

  runApp(const App());
}

Future<void> _checkLocalBackend() async {
  try {
    final uri = Uri.parse('${Constants.apiBaseUrl}/health');
    final request =
        await HttpClient().getUrl(uri).timeout(const Duration(seconds: 15));
    final response = await request.close().timeout(const Duration(seconds: 15));
    if (response.statusCode == HttpStatus.ok) {
      log('Local backend reachable at ${Constants.apiBaseUrl}/health');
    } else {
      log('Local backend responded with status: ${response.statusCode}');
    }
  } catch (e, st) {
    log('Local backend connection failed: $e', stackTrace: st);
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MotoHunters",
      debugShowCheckedModeBanner: false,
      theme: Themes.dark(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      //translations: AppTranslations(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      defaultTransition: Transition.size,
      transitionDuration: const Duration(milliseconds: 300),
      initialBinding: InitialBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
