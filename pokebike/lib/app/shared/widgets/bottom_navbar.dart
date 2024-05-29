import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/micon.dart';

class BottomNavbarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void onTap(int newIndex) {
    currentIndex.value = newIndex;
  }
}

class BottomNavbarButton extends StatelessWidget {
  final int index;
  final RxInt currentIndex;
  final String iconName;
  final String label;
  final Color selectedColor;
  final Color unselectedColor;
  final Function(int) onTap;
  final double? size;

  const BottomNavbarButton(
      {super.key,
      required this.index,
      required this.currentIndex,
      required this.iconName,
      required this.label,
      required this.onTap,
      this.selectedColor = MColors.secondary,
      this.unselectedColor = Colors.grey,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Color color =
          currentIndex.value == index ? selectedColor : unselectedColor;
      final String addName = currentIndex.value == index ? " red" : "";
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => onTap(index),
            child: MIcon(
              name: iconName + addName,
              // color: color,
              size: size,
            ),
          ),
          Text(
            label,
            style: TextStyle(color: color),
          )
        ],
      );
    });
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    // starting point
    double spX = w * 1 / 4;
    double spY = h;

    // left bezier 1
    double lb1X = w * 1 / 4;
    double lb1Y = h;

    // left bezier 2
    double lb2X = w * 1 / 2.6;
    double lb2Y = h;

    // left bezier 3
    double lb3X = w * 1 / 2.6;
    double lb3Y = h * 1 / 1.3;

    // central point
    double cpX = w / 2;
    double cpY = h / 4;

    // right bezier 1
    double rb1X = w - lb3X;
    double rb1Y = lb3Y;

    // left bezier 2
    double rb2X = w - lb2X;
    double rb2Y = lb2Y;

    // left bezier 3
    double rb3X = w - lb1X;
    double rb3Y = lb1Y;

    // ending point
    double epX = w - spX;
    double epY = h;

    Path path = Path()
      ..moveTo(spX, spY)
      ..cubicTo(lb1X, lb1Y, lb2X, lb2Y, lb3X, lb3Y)
      // ..lineTo(lb3X, lb3Y + 0)
      ..arcToPoint(Offset(rb1X, rb1Y + 60), radius: Radius.circular(1))
      // ..quadraticBezierTo(cpX, cpY, rb1X, rb1Y)
      ..lineTo(rb1X, rb1Y)
      ..cubicTo(rb2X, rb2Y, rb3X, rb3Y, epX, epY)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomNavbar extends GetView<BottomNavbarController> {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 80,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: MColors.primary),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            height: 80,
            child: ClipPath(
              clipper: BezierClipper(),
              child: Container(
                color: MColors.primary,
              ),
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          height: 150,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BottomNavbarButton(
                index: 0,
                label: "Home",
                currentIndex: controller.currentIndex,
                iconName: "Home icon",
                onTap: controller.onTap,
              ),
              BottomNavbarButton(
                index: 1,
                label: "Garage",
                currentIndex: controller.currentIndex,
                iconName: "Garage icon",
                onTap: controller.onTap,
              ),
              // const SizedBox(width: 48), // space for the floating action button
              BottomNavbarButton(
                  index: 20,
                  label: "Fotocamera",
                  currentIndex: 100.obs,
                  onTap: controller.onTap,
                  size: 70,
                  iconName: "Logo"),
              BottomNavbarButton(
                index: 2,
                label: "Torneo",
                currentIndex: controller.currentIndex,
                iconName: "Torneo icon",
                onTap: controller.onTap,
              ),
              BottomNavbarButton(
                index: 3,
                label: "Profilo",
                currentIndex: controller.currentIndex,
                iconName: "Profile icon",
                onTap: controller.onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
