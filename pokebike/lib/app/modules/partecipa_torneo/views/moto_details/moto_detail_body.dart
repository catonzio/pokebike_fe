import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/moto-details/moto_details_arguments.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_chosen_slider.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/giant_title.dart';

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
          padding: const EdgeInsets.all(4.0),
          child: GiantTitle(
            title: moto.nome,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            moto.descrizione,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () => context.navigator.pushNamed(Routes.MOTO_DETAILS,
                  arguments:
                      MotoDetailsArguments(moto: moto, isOwnMoto: false)),
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
            GestureDetector(
                onTap: () => onPrevious(),
                child:
                    SvgPicture.asset("assets/images/left_selection_arrow.svg")),
            MotoChosenSlider(index: moto.id),
            GestureDetector(
                onTap: () => onNext(),
                child: SvgPicture.asset(
                    "assets/images/right_selection_arrow.svg")),
          ],
        ),
      ],
    );
  }
}
