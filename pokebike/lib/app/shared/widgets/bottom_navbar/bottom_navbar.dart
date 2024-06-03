import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bezier_clipper.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_button.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_controller.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/navbar_item.dart';

class BottomNavbar extends GetView<BottomNavbarController> {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        _bottomContainer(),
        _upperCircle(),
        _buttonsRow(context),
      ],
    );
  }

  Positioned _buttonsRow(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      height: 150,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: bottomNavbarItems.indexed.map(((int, NavbarItem) el) {
          return BottomNavbarButton(
            index: el.$1,
            label: el.$2.label,
            currentIndex: controller.currentIndex,
            iconName: el.$2.iconName,
            route: el.$2.route,
            onTap: (int indx) => _onTap(context, indx),
            size: el.$2.size,
          );
        }).toList(),
        // [
        //   BottomNavbarButton(
        //     index: 0,
        //     label: "Home",
        //     currentIndex: controller.currentIndex,
        //     iconName: "Home icon",
        //     onTap: controller.onTap,
        //   ),
        //   BottomNavbarButton(
        //     index: 1,
        //     label: "Garage",
        //     currentIndex: controller.currentIndex,
        //     iconName: "Garage icon",
        //     onTap: controller.onTap,
        //   ),
        //   // const SizedBox(width: 48), // space for the floating action button
        //   BottomNavbarButton(
        //       index: 20,
        //       label: "Fotocamera",
        //       currentIndex: 100.obs,
        //       onTap: controller.onTap,
        //       size: 70,
        //       iconName: "Logo"),
        //   BottomNavbarButton(
        //     index: 2,
        //     label: "Torneo",
        //     currentIndex: controller.currentIndex,
        //     iconName: "Torneo icon",
        //     onTap: controller.onTap,
        //   ),
        //   BottomNavbarButton(
        //     index: 3,
        //     label: "Profilo",
        //     currentIndex: controller.currentIndex,
        //     iconName: "Profile icon",
        //     onTap: controller.onTap,
        //   ),
        // ],
      ),
    );
  }

  void _onTap(BuildContext context, int newIndex) {
    int oldIndex = controller.currentIndex.value;
    controller.currentIndex.value = newIndex;
    context.navigator.pushNamed(bottomNavbarItems[newIndex].route).then((_) {
      controller.currentIndex.value = oldIndex;
    });
  }

  Positioned _upperCircle() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 80,
        height: 80,
        child: ClipPath(
          clipper: BezierClipper(),
          child: Container(
            color: MColors.primary,
          ),
        ));
  }

  Positioned _bottomContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 80,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: MColors.primary),
      ),
    );
  }
}
