import 'package:flutter/material.dart';
import 'package:pokebike/app/modules/home/views/tornei/tornei_list.dart';
import 'package:pokebike/app/modules/home/views/tornei/tornei_title.dart';

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
          SizedBox(height: height * 0.75, child: const TorneiList()),
        ],
      ),
    );
  }
}
