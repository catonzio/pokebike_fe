import 'package:pokebike/app/routes/app_pages.dart';

class NavbarItem {
  final String label;
  final String iconName;
  final String route;
  final double? size;

  NavbarItem(
      {required this.label,
      required this.iconName,
      required this.route,
      this.size});
}

final List<NavbarItem> bottomNavbarItems = [
  NavbarItem(
    label: "Home",
    iconName: "Home icon",
    route: Routes.HOME,
  ),
  NavbarItem(
    label: "Garage",
    iconName: "Garage icon",
    route: Routes.GARAGE,
  ),
  NavbarItem(
    label: "Fotocamera",
    iconName: "Logo",
    size: 70,
    route: Routes.FOTOCAMERA,
  ),
  NavbarItem(
    label: "Torneo",
    iconName: "Torneo icon",
    route: Routes.TORNEO,
  ),
  NavbarItem(
    label: "Profilo",
    iconName: "Profile icon",
    route: Routes.PROFILE,
  ),
];
