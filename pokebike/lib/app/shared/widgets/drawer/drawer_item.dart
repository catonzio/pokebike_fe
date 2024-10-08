import 'package:get/get.dart';
import 'package:pokebike/app/data/enums/garage_type.dart';
import 'package:pokebike/app/routes/app_pages.dart';

class DrawerItem {
  final String title;
  final String icon;
  final String path;
  final dynamic arguments;

  const DrawerItem(
      {required this.title,
      required this.icon,
      required this.path,
      this.arguments});
}

List<DrawerItem> drawerItems = [
  DrawerItem(
    title: 'home'.tr,
    icon: "Home icon white",
    path: Routes.HOME,
  ),
  DrawerItem(
      title: 'myGarage'.tr,
      icon: "Garage icon white",
      path: Routes.GARAGE,
      arguments: GarageType.garage),
  DrawerItem(
    title: 'tournament'.tr,
    icon: "Torneo icon white",
    path: Routes.TORNEO,
  ),
  DrawerItem(
    title: 'community'.tr,
    icon: "Community icon white",
    path: Routes.COMMUNITY,
  ),
  DrawerItem(
      title: 'collection'.tr,
      icon: "Collection icon white",
      path: Routes.GARAGE,
      arguments: GarageType.collection),
  DrawerItem(
      title: 'leaderboard'.tr,
      icon: "Classifica icon white",
      path: Routes.LEADERBOARD),
  DrawerItem(
    title: 'profile'.tr,
    icon: "Profile icon white",
    path: Routes.PROFILE,
  ),
  DrawerItem(
    title: 'notifications'.tr,
    icon: "Notification icon white",
    path: Routes.NOTIFICATIONS,
  )
];

DrawerItem drawerItemLogout = DrawerItem(
  title: 'logout'.tr,
  icon: "Logout icon white",
  path: Routes.LOGIN,
);
