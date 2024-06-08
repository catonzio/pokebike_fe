import 'package:flutter/material.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/tornei_tile.dart';

class TorneiList extends StatelessWidget {
  final double itemExtent;
  final Axis scrollDirection;
  final bool scroll;

  const TorneiList(
      {super.key,
      required this.itemExtent,
      required this.scrollDirection,
      this.scroll = true});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TorneiTile(
            text: "Partecipa al torneo",
            imageName: "partecipa_al_torneo.jpg",
            onTap: () => context.navigator.pushNamed(Routes.PARTECIPA_TORNEO)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TorneiTile(text: "Vota", imageName: "vota.jpg", onTap: () => {}),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TorneiTile(
            text: "Classifica", imageName: "classifica.jpg", onTap: () => {}),
      )
    ];

    if (scroll) {
      return ListView(
          itemExtent: itemExtent,
          scrollDirection: scrollDirection,
          children: children);
    } else {
      return scrollDirection == Axis.horizontal
          ? Row(
              children: children
                  .map((Widget el) => SizedBox(width: itemExtent, child: el))
                  .toList())
          : Column(
              children: children
                  .map((Widget el) => SizedBox(height: itemExtent, child: el))
                  .toList(),
            );
    }
  }
}
