import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
  final int totalLen;
  final Function() onPrevious;
  final Function() onNext;

  const MotoDetailBody({
    super.key,
    required this.moto,
    required this.index,
    required this.totalLen,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: context.height * 0.1,
            child: GiantTitle(
              title: moto.nome,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: context.height * 0.1,
            child: AutoSizeText(
              moto.descrizione,
              maxLines: 10,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () => context.pushNamed(Routes.MOTO_DETAILS,
                  arguments:
                      MotoDetailsArguments(moto: moto)),
              child: Hero(
                tag: "visualizza_moto",
                child: Text(
                  'seeInfo'.tr,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: Colors.amber),
                ),
              )),
        ),
        const Spacer(),
        Hero(
          tag: "bottom",
          child: Material(
            type: MaterialType.transparency,
            child: SizedBox(
              height: context.height * 0.23,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: index > 0
                            ? GestureDetector(
                                onTap: () => onPrevious(),
                                child: SvgPicture.asset(
                                    "assets/images/left_selection_arrow.svg"))
                            : const SizedBox.shrink(),
                      )),
                  Expanded(
                      flex: 4,
                      child: SizedBox(
                          height: context.height * 0.05,
                          child: MotoChosenButton(motoId: moto.id))),
                  Expanded(
                      flex: 3,
                      child: index < totalLen
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () => onNext(),
                                  child: SvgPicture.asset(
                                      "assets/images/right_selection_arrow.svg")),
                            )
                          : const SizedBox.shrink())
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
