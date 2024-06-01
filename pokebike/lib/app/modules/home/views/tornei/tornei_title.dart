import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

class TorneiTitle extends StatelessWidget {
  const TorneiTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: ShimmerTitle(
        text: "Tornei",
        style: context.textTheme.headlineLarge!
            .copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
        colors: const [Colors.white, Colors.grey, Colors.white],
      ),
    );
  }
}
