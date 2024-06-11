import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/scelta_moto_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/mslider.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class MotoDetailPage extends GetView<SceltaMotoController> {
  final int index;
  const MotoDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultPage(
          backButton: !controller.isMotoChosen.value,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: index,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: MimageNetwork(
                        path: MImageProvider.getImageUrl(index: index),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Obx(() => controller.isMotoChosen.value
                        ? const MotoDetailChosen()
                        : MotoDetailBody(index: index))),
              ],
            ),
          ),
        ));
  }
}

class MotoDetailChosen extends GetView<SceltaMotoController> {
  const MotoDetailChosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16, right: 16, bottom: context.height * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Moto registrata al torneo con successo",
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          MButton(
              label: "Torna alla home", onTap: () => _tornaAllaHome(context))
        ],
      ),
    );
  }

  void _tornaAllaHome(BuildContext context) {
    // controller.reset();
    context.navigator.pushReplacementNamed(Routes.HOME);
  }
}

class MotoDetailBody extends StatelessWidget {
  const MotoDetailBody({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Moto $index",
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
              onTap: () => {},
              child: Text(
                "Visualizza moto",
                style:
                    context.textTheme.bodyMedium?.copyWith(color: Colors.amber),
              )),
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () => context.navigator.pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            MotoDetailPage(index: index - 1))),
                child:
                    SvgPicture.asset("assets/images/left_selection_arrow.svg")),
            MSlider(index: index),
            InkWell(
                onTap: () => context.navigator.pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            MotoDetailPage(index: index + 1))),
                child: SvgPicture.asset(
                    "assets/images/right_selection_arrow.svg")),
          ],
        ),
      ],
    );
  }
}
