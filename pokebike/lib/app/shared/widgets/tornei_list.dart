import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/tornei_tile.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
            text: S.of(context).partecipateTournaments,
            imageName: "partecipa_al_torneo.jpg",
            onTap: () => Get.context!.pushNamed(Routes.PARTECIPA_TORNEO)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TorneiTile(
            text: S.of(context).vote,
            imageName: "vota.jpg",
            onTap: () => Get.context!.pushNamed(Routes.VOTA)),
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TorneiTile(
              text: S.of(context).leaderboard,
              imageName: "classifica.jpg",
              onTap: () => Get.context!.pushNamed(Routes.LEADERBOARD)))
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
