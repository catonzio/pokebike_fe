import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';
import 'package:pokebike/app/shared/widgets/tornei_list.dart';

import '../controllers/torneo_controller.dart';

class TorneoView extends GetView<TorneoController> {
  const TorneoView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: ShimmerTitle.light(
              text: 'tournament'.tr,
            ),
          ),
          Expanded(
            child: TorneiList(
              itemExtent: context.height * 0.134,
              scrollDirection: Axis.vertical,
              scroll: false,
            ),
          )
        ],
      ),
    ));
  }
}
