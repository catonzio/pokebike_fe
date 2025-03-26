import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/translations/app_translations.dart';
import 'package:moto_hunters/app/config/themes.dart';
import 'package:moto_hunters/app/shared/bindings/initial_bindings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
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
      translations: AppTranslations(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('it'),
        Locale('es'),
        Locale('fr')
      ],
      defaultTransition: Transition.size,
      transitionDuration: const Duration(milliseconds: 300),
      initialBinding: InitialBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
