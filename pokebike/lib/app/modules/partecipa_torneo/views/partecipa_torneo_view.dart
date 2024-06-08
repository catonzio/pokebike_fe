import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/modules/garage/views/garage_card_view.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PartecipaTorneoView extends GetView<PartecipaTorneoController> {
  const PartecipaTorneoView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ShimmerTitle.light(text: "Scegli la tua moto"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: SearchRow(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RefreshIndicator(
                  child: const PartecipaTorneoGrid(),
                  onRefresh: () async => controller.onRefresh),
            ),
          )
        ],
      ),
    ));
  }
}

class PartecipaTorneoGrid extends GetView<PartecipaTorneoController> {
  const PartecipaTorneoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
        enabled: controller.isFetching.value,
        child: controller.isFetching.value
            ? _gridOfElements(
                mapListToWidget(context, controller.fakeCollections))
            : (controller.collections.isEmpty
                ? const EmptyPartecipaTorneoGrid()
                : _gridOfElements(
                    mapListToWidget(context, controller.collections),
                    padding: const EdgeInsets.only(
                        bottom: Constants.bottomNavbarHeight)))));
  }

  List<Widget> mapListToWidget(BuildContext context, List<int> list) {
    return list
        .map((index) => Hero(
              tag: index,
              child: Material(
                child: GarageCardWidget(
                    index: index,
                    onTap: () {
                      context.navigator.push(
                        MaterialPageRoute(
                            builder: (context) => MotoDetailPage(
                                  index: index,
                                )),
                      );
                    }),
              ),
            ))
        .toList();
  }

  Widget _gridOfElements(List<Widget> elements, {EdgeInsetsGeometry? padding}) {
    return GridView(
      padding: padding ?? EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      children: elements,
    );
  }
}

class EmptyPartecipaTorneoGrid extends StatelessWidget {
  const EmptyPartecipaTorneoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Non hai ancora collezionato nessuna moto",
          style: context.textTheme.titleMedium,
        ),
        MButton.red(
            onPressed: () => context.navigator.pushNamed(Routes.FOTOCAMERA),
            child: const Text("Inizia a collezionare")),
      ],
    );
  }
}

class MotoDetailPage extends StatelessWidget {
  final int index;
  const MotoDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      backButton: true,
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
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.amber),
                  )),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => {},
                    child: SvgPicture.asset(
                        "assets/images/left_selection_arrow.svg")),
                const MSlider(),
                InkWell(
                    onTap: () => {},
                    child: SvgPicture.asset(
                        "assets/images/right_selection_arrow.svg")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MSlider extends StatelessWidget {
  const MSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.13,
      height: context.height * 0.2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.keyboard_arrow_up_outlined,
            color: Colors.black,
            size: 28,
          ),
          Icon(
            Icons.keyboard_arrow_up_outlined,
            color: Colors.black.withOpacity(0.5),
            size: 28,
          )
        ],
      ),
    );
  }
}
