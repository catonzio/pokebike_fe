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
    label: "Home",
    iconName: "Home icon",
    size: 30,
    route: Routes.HOME,
  ),
  NavbarItem(
    label: "Garage",
    iconName: "Garage icon",
    size: 30,
    route: Routes.GARAGE,
  ),
  NavbarItem(
    label: "Fotocamera",
    iconName: "Logo",
    size: 70,
    route: Routes.FOTOCAMERA,
    // shouldPop: false,
  ),
  NavbarItem(
    label: "Torneo",
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
    label: "Profilo",
    iconName: "Profile icon",
    size: 30,
    route: Routes.PROFILE,
    routes: [Routes.PROFILE, Routes.SETTINGS],
  ),
];
