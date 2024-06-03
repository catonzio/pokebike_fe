import 'package:pokebike/app/routes/app_pages.dart';

class DrawerItem {
  final String title;
  final String icon;
  final String path;

  const DrawerItem(
      {required this.title, required this.icon, required this.path});
}

const List<DrawerItem> drawerItems = [
  DrawerItem(title: "Home", icon: "Home icon white", path: Routes.HOME),
  DrawerItem(
      title: "Il mio garage", icon: "Garage icon white", path: Routes.GARAGE),
  DrawerItem(title: "Torneo", icon: "Torneo icon white", path: Routes.TORNEO),
  DrawerItem(
      title: "Community", icon: "Community icon white", path: Routes.COMMUNITY),
  DrawerItem(
      title: "Collezione", icon: "Collection icon white", path: Routes.GARAGE),
  DrawerItem(
      title: "Classifica",
      icon: "Classifica icon white",
      path: Routes.LEADERBOARD),
  DrawerItem(
      title: "Profilo", icon: "Profile icon white", path: Routes.PROFILE),
  DrawerItem(
      title: "Notifiche",
      icon: "Notification icon white",
      path: Routes.NOTIFICATIONS)
];

const DrawerItem drawerItemLogout =
    DrawerItem(title: "Logout", icon: "Logout icon white", path: Routes.LOGIN);
