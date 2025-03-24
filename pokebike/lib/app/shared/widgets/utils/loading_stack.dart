import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';

class LoadingStack extends StatelessWidget {
  final Widget child;
  final RxBool isLoading;
  final Widget topper;
  final double sigmaX;
  final double sigmaY;

  const LoadingStack(
      {super.key,
      required this.child,
      required this.isLoading,
      this.sigmaX = 5,
      this.sigmaY = 5,
      this.topper = const Center(child: MCircularProgressIndicator())});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            child,
            if (isLoading.value)
              Container(
                color: Colors.transparent,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                  child: topper,
                ).animate().fade(),
              )
          ],
        ));
  }
}
