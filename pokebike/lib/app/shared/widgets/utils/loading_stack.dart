import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/paginator_widget.dart';

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
    return Obx(() => Stack(
          children: [
            child,
            if (isLoading.value)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const Center(child: MCircularProgressIndicator()),
              ).animate().fade()
          ],
        ));
  }
}
