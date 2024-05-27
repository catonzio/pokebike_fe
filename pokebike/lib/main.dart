import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/themes.dart';
import 'package:pokebike/app/shared/bindings/initial_bindings.dart';

import 'app/routes/app_pages.dart';

void main() {
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
      initialBinding: InitialBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
