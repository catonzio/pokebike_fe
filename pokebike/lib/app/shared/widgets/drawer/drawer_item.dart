import 'package:get/get.dart';
import 'package:moto_hunters/app/data/enums/garage_type.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
    title: S.of(Get.context!).home,
    icon: "Home icon white",
    path: Routes.HOME,
  ),
  DrawerItem(
      title: S.of(Get.context!).myGarage,
      icon: "Garage icon white",
      path: Routes.GARAGE,
      arguments: GarageType.garage),
  DrawerItem(
    title: S.of(Get.context!).tournament,
    icon: "Torneo icon white",
    path: Routes.TORNEO,
  ),
  DrawerItem(
    title: S.of(Get.context!).community,
    icon: "Community icon white",
    path: Routes.COMMUNITY,
  ),
  DrawerItem(
      title: S.of(Get.context!).collection,
      icon: "Collection icon white",
      path: Routes.GARAGE,
      arguments: GarageType.collection),
  DrawerItem(
      title: S.of(Get.context!).leaderboard,
      icon: "Classifica icon white",
      path: Routes.LEADERBOARD),
  DrawerItem(
    title: S.of(Get.context!).profile,
    icon: "Profile icon white",
    path: Routes.PROFILE,
  ),
  DrawerItem(
    title: S.of(Get.context!).notifications,
    icon: "Notification icon white",
    path: Routes.NOTIFICATIONS,
  )
];

DrawerItem drawerItemLogout = DrawerItem(
  title: S.of(Get.context!).logout,
  icon: "Logout icon white",
  path: Routes.LOGIN,
);
