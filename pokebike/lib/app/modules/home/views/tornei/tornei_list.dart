import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/home/views/tornei/tornei_tile.dart';

class TorneiList extends StatelessWidget {
  const TorneiList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemExtent: context.width * 0.6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TorneiTile(text: "Partecipa al torneo", onTap: () => {}),
          );
        });
  }
}
