import 'package:get/get.dart';

import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/community_view.dart';
import '../modules/fotocamera/bindings/fotocamera_binding.dart';
import '../modules/fotocamera/views/fotocamera_view.dart';
import '../modules/garage/bindings/garage_binding.dart';
import '../modules/garage/views/garage_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_register/bindings/confirm_register_binding.dart';
import '../modules/login_register/bindings/login_binding.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/bindings/register_binding.dart';
import '../modules/login_register/views/confirm_register_view.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/login_register/views/login_view.dart';
import '../modules/login_register/views/register_view.dart';
import '../modules/presentation/bindings/presentation_binding.dart';
import '../modules/presentation/views/presentation_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/torneo/bindings/torneo_binding.dart';
import '../modules/torneo/views/torneo_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
    GetPage(
      name: _Paths.GARAGE,
      page: () => const GarageView(),
      binding: GarageBinding(),
    ),
    GetPage(
      name: _Paths.TORNEO,
      page: () => const TorneoView(),
      binding: TorneoBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.FOTOCAMERA,
      page: () => const FotocameraView(),
      binding: FotocameraBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const CommunityView(),
      binding: CommunityBinding(),
    ),
  ];
}
