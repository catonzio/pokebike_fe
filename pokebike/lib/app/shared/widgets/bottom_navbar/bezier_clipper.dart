import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // double cpX = w / 2;
    // double cpY = h / 4;

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
    double epX = w;
    double epY = h;

    Path path = Path()
      ..moveTo(spX, spY)
      ..cubicTo(lb1X, lb1Y, lb2X, lb2Y, lb3X, lb3Y)
      // ..lineTo(lb3X, lb3Y + 0)
      ..arcToPoint(Offset(rb1X, rb1Y + 50), radius: const Radius.circular(1))
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
