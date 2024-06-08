import 'package:get/get.dart';

import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/community_view.dart';
import '../modules/fotocamera/bindings/fotocamera_binding.dart';
import '../modules/fotocamera/views/fotocamera_view.dart';
import '../modules/garage/bindings/garage_binding.dart';
import '../modules/garage/views/garage_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login_register/bindings/confirm_register_binding.dart';
import '../modules/login_register/bindings/login_binding.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/bindings/register_binding.dart';
import '../modules/login_register/views/confirm_register_view.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/login_register/views/login_view.dart';
import '../modules/login_register/views/register_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/partecipa_torneo/bindings/partecipa_torneo_binding.dart';
import '../modules/partecipa_torneo/views/partecipa_torneo_view.dart';
import '../modules/presentation/bindings/presentation_binding.dart';
import '../modules/presentation/views/presentation_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/torneo/bindings/torneo_binding.dart';
import '../modules/torneo/views/torneo_view.dart';
import '../shared/widgets/pagination/pagination_bindings.dart';

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
    GetPage(
      name: _Paths.GARAGE,
      page: () => const GarageView(),
      bindings: [GarageBinding(), PaginationBindings()],
    ),
    GetPage(
      name: _Paths.TORNEO,
      page: () => const TorneoView(),
      binding: TorneoBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      bindings: [ProfileBinding(), PaginationBindings()],
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
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => const LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PARTECIPA_TORNEO,
      page: () => const PartecipaTorneoView(),
      binding: PartecipaTorneoBinding(),
    ),
  ];
}
