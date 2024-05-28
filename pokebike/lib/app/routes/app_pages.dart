import 'package:get/get.dart';

import '../modules/login_register/bindings/confirm_register_binding.dart';
import '../modules/login_register/views/confirm_register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_register/bindings/login_binding.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/bindings/register_binding.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/login_register/views/login_view.dart';
import '../modules/login_register/views/register_view.dart';
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
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_REGISTER,
      page: () => const ConfirmRegisterView(),
      binding: ConfirmRegisterBinding(),
    ),
  ];
}
