import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/presentation/bindings/presentation_binding.dart';
import '../modules/presentation/views/presentation_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_REGISTER,
      page: () => const LoginRegisterView(),
      binding: LoginRegisterBinding(),
    ),
    GetPage(
      name: _Paths.PRESENTATION,
      page: () => const PresentationView(),
      binding: PresentationBinding(),
    ),
  ];
}
