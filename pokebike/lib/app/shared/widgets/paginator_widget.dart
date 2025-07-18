import 'package:flutter/material.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:get/get.dart';

class PaginatorWidget extends StatelessWidget {
  final Widget body;
  final bool showIndicator;

  const PaginatorWidget(
      {super.key, required this.body, required this.showIndicator});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body,
        if (showIndicator)
          const Positioned(
              left: 0,
              right: 0,
              bottom: Constants.bottomNavbarHeight / 1.7,
              child: MCircularProgressIndicator())
      ],
    );
  }
}

class MCircularProgressIndicator extends StatelessWidget {
  final double? value;

  const MCircularProgressIndicator({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: MColors.primary,
        ),
        child: CircularProgressIndicator(
          value: value,
        ),
      ),
    );
  }
}
