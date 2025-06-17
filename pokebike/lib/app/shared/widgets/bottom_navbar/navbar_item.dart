import 'package:get/get.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
    label: S.of(Get.context!).home,
    iconName: "Home icon",
    size: 30,
    route: Routes.HOME,
  ),
  NavbarItem(
    label: S.of(Get.context!).garage,
    iconName: "Garage icon",
    size: 30,
    route: Routes.GARAGE,
  ),
  NavbarItem(
    label: S.of(Get.context!).photocamera,
    iconName: "Logo",
    size: 70,
    route: Routes.FOTOCAMERA,
    // shouldPop: false,
  ),
  NavbarItem(
    label: S.of(Get.context!).tournament,
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
    label: S.of(Get.context!).profile,
    iconName: "Profile icon",
    size: 30,
    route: Routes.PROFILE,
    routes: [Routes.PROFILE, Routes.SETTINGS],
  ),
];
