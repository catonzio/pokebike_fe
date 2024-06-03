import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class LoadingStack extends StatelessWidget {
  final Widget child;
  final RxBool isLoading;

  const LoadingStack({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => isLoading.value
        ? Stack(
            children: [
              child,
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const Center(child: CircularProgressIndicator()),
              ).animate().fade()
            ],
          )
        : child);
  }
}
