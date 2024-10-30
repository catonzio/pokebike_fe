import 'package:get/get.dart';
import 'package:pokebike/app/routes/app_pages.dart';

class NavbarItem {
  final String label;
  final String iconName;
  final String route;
  final List<String>? routes;
  final double? size;
  final bool shouldPop;

  NavbarItem(
      {required this.label,
      required this.iconName,
      required this.route,
      this.shouldPop = false,
      this.routes,
      this.size});
}

final List<NavbarItem> bottomNavbarItems = [
  NavbarItem(
    label: 'home'.tr,
    iconName: "Home icon",
    size: 30,
    route: Routes.HOME,
  ),
  NavbarItem(
    label: 'garage'.tr,
    iconName: "Garage icon",
    size: 30,
    route: Routes.GARAGE,
  ),
  NavbarItem(
    label: 'photocamera'.tr,
    iconName: "Logo",
    size: 70,
    route: Routes.FOTOCAMERA,
    // shouldPop: false,
  ),
  NavbarItem(
    label: 'tournament'.tr,
    iconName: "Torneo icon",
    size: 30,
    route: Routes.TORNEO,
    routes: [
      Routes.TORNEO,
      Routes.PARTECIPA_TORNEO,
      Routes.LEADERBOARD,
      Routes.VOTA
    ],
  ),
  NavbarItem(
    label: 'profile'.tr,
    iconName: "Profile icon",
    size: 30,
    route: Routes.PROFILE,
    routes: [Routes.PROFILE, Routes.SETTINGS],
  ),
];
