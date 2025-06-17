import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';
import 'package:moto_hunters/generated/l10n.dart';

class TorneiTitle extends StatelessWidget {
  const TorneiTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: ShimmerTitle.light(
        text: S.of(context).tournaments,
        style: Get.context!.textTheme.headlineLarge!
            .copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
    );
  }
}
