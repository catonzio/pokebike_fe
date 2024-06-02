import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/micon.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

class DrawerItem {
  final String title;
  final String icon;
  final Function() onTap;

  DrawerItem({required this.title, required this.icon, required this.onTap});
}

List<DrawerItem> drawerItems = [
  DrawerItem(
      title: "Home", icon: "Home icon white", onTap: () => {print("Home")}),
  DrawerItem(
      title: "Il mio garage",
      icon: "Garage icon white",
      onTap: () => {print("Il mio garage")}),
  DrawerItem(
      title: "Torneo",
      icon: "Torneo icon white",
      onTap: () => {print("Torneo")}),
  DrawerItem(
      title: "Community",
      icon: "Community icon white",
      onTap: () => {print("Community")}),
  DrawerItem(
      title: "Collezione",
      icon: "Collection icon white",
      onTap: () => {print("Collezione")}),
  DrawerItem(
      title: "Classifica",
      icon: "Classifica icon white",
      onTap: () => {print("Classifica")}),
  DrawerItem(
      title: "Profilo",
      icon: "Profile icon white",
      onTap: () => {print("Profilo")}),
  DrawerItem(
      title: "Notifiche",
      icon: "Notification icon white",
      onTap: () => {print("Notifiche")})
];

class DrawerItemWidget extends StatelessWidget {
  final DrawerItem item;
  const DrawerItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: MIcon(name: item.icon),
          ),
          Text(item.title)
        ],
      ),
    );
  }
}

class Mdrawer extends StatelessWidget {
  const Mdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage("assets/images/drawer_bg.png"),
              fit: BoxFit.cover)),
      padding: const EdgeInsets.only(left: 16.0, bottom: 128),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.height * 0.1, bottom: 32.0),
            child: const ShimmerTitle(
              text: "Ciao Biker!",
              colors: [Colors.white, Colors.grey, Colors.white],
            ),
          ),
          ...drawerItems.map((e) => Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: DrawerItemWidget(item: e),
              )),
          const Spacer(),
          DrawerItemWidget(
              item: DrawerItem(
                  title: "Logout", icon: "Logout icon white", onTap: () => {})),
        ],
      ),
    );
  }
}
