import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_chosen_slider.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_photo.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class MotoDetailBody extends StatelessWidget {
  final Moto moto;
  final int index;
  final Function() onPrevious;
  final Function() onNext;

  const MotoDetailBody({
    super.key,
    required this.moto,
    required this.index,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            moto.nome,
            style: context.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Erede di un retaggio nato nel 1957, l’irriverente e ricercato Sportster S di Harley-Davidson evolve i tratti universalmente amati dei suoi predecessori: velocità scattante, agilità sorprendente e divertimento assicurato.",
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
              onTap: () => context.navigator.push(
                    MaterialPageRoute(
                        builder: (context) => MotoDetailPhoto(moto: moto)),
                  ),
              child: Hero(
                tag: "visualizza_moto",
                child: Text(
                  "Visualizza moto",
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: Colors.amber),
                ),
              )),
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () => onPrevious(),
                child:
                    SvgPicture.asset("assets/images/left_selection_arrow.svg")),
            MotoChosenSlider(index: moto.id),
            InkWell(
                onTap: () => onNext(),
                child: SvgPicture.asset(
                    "assets/images/right_selection_arrow.svg")),
          ],
        ),
      ],
    );
  }
}
