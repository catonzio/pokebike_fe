import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/widgets/tornei_list.dart';
import 'package:moto_hunters/app/modules/home/views/tornei/tornei_title.dart';

class TorneiWidget extends StatelessWidget {
  final double height;

  const TorneiWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    // Tre bottoni: partecipa, vota, classifica
    return SizedBox(
      height: height,
      child: Column(
        children: [
          const TorneiTitle(),
          SizedBox(
              height: height * 0.75,
              child: TorneiList(
                itemExtent: Get.context!.width * 0.6,
                scrollDirection: Axis.horizontal,
              )),
        ],
      ),
    );
  }
}
