import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

class UpperButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function() onTap;

  const UpperButton(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: Get.context!.width * 0.4,
        height: Get.context!.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: MColors.containerRed,
        ),
        child: ClipPath(
          clipper: TrapezoidClipper(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [MColors.primary, MColors.containerRed],
                stops: [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [MIcon(name: icon), Text(text)],
            ),
          ),
        ),
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path()
      ..moveTo(0, h)
      ..lineTo(w, h)
      ..lineTo(w, h * 0.4)
      ..quadraticBezierTo(w, h * 0.16, 0, h * 0.05)
      // ..lineTo(w, h * 0.4)
      // ..lineTo(0, h * 0.05)

      // ..quadraticBezierTo(0, h, w * 0.1, h)
      // ..moveTo(0, h * 0.95)
      // ..lineTo(w * 0.95, h)
      // ..quadraticBezierTo(w, h, w, h * 0.95)
      // ..lineTo(w, h * 0.4)
      // ..quadraticBezierTo(w, h * 0.05, w * 0.95, h * 0.05)
      // ..lineTo(w * 0.1, h * 0.05)
      // ..quadraticBezierTo(0, 0, 0, h * 0.05)

      // ..lineTo(0, h)
      // ..lineTo(w, h)
      // ..lineTo(w, h * 0.4)
      ..close();

    // var path = new Path();
    // path.lineTo(0.0, size.height - 20);
    // path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    // path.lineTo(size.width - 20.0, size.height);
    // path.quadraticBezierTo(size.width, size.height, size.width, size.height - 20);
    // path.lineTo(size.width, 50.0);
    // path.quadraticBezierTo(size.width, 30.0, size.width - 20.0, 30.0);
    // path.lineTo(20.0, 5.0);
    // path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);
    // return path;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
