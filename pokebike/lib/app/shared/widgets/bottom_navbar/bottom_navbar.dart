import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bezier_clipper.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_button.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar_controller.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/navbar_item.dart';

class BottomNavbar extends GetView<BottomNavbarController> {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "navbar",
      child: Material(
        type: MaterialType.transparency,
        elevation: 1,
        child: Stack(
          fit: StackFit.loose,
          children: [
            _bottomContainer(Constants.bottomNavbarHeight / 2.5),
            _upperCircle(Constants.bottomNavbarHeight / 2.5),
            _buttonsRow(context),
          ],
        ),
      ),
    );
  }

  Positioned _buttonsRow(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: Constants.bottomNavbarHeight / 10,
      height: Constants.bottomNavbarHeight, // 150,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: bottomNavbarItems.indexed.map(((int, NavbarItem) el) {
          return BottomNavbarButton(
            item: el.$2,
            index: el.$1,
            currentIndex: controller.currentIndex,
            onTap: (int indx) => _onTap(context, indx),
          );
        }).toList(),
      ),
    );
  }

  void _onTap(BuildContext context, int newIndex) {
    int oldIndex = controller.currentIndex.value;
    controller.currentIndex.value = newIndex;
    final bottomNavbarItem = bottomNavbarItems[newIndex];
    final navigatorFunc = bottomNavbarItem.shouldPop
        ? context.navigator.popAndPushNamed
        : context.navigator.pushNamed;
    navigatorFunc(bottomNavbarItem.route).then((_) {
      controller.currentIndex.value = oldIndex;
    });
  }

  Positioned _upperCircle(double height) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: height,
        height: height,
        child: ClipPath(
          clipper: BezierClipper(),
          child: Container(
            color: MColors.bottomNavbarColor,
          ),
        ));
  }

  Positioned _bottomContainer(double height) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: height,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: MColors.bottomNavbarColor),
      ),
    );
  }
}
