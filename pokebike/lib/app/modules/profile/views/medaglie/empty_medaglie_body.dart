import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/modules/profile/controllers/profile_controller.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EmptyMedaglieBody extends GetView<ProfileController> {
  const EmptyMedaglieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: context.width,
          padding: const EdgeInsets.all(8.0),
          child: Skeletonizer(
              enabled: controller.isLoadingMedaglie.value,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 0),
                children: const [
                  DividerTitle("MEDAGLIE"),
                  MedaglieRowWidget(),
                  DividerTitle("COCCARDE"),
                  CoccardeWrapWidget()
                ],
              )),
        ));
  }
}

class DividerTitle extends StatelessWidget {
  final String text;
  const DividerTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Expanded(
          child: Divider(
            color: Colors.white,
            height: 15,
          ),
        ),
        SizedBox(
            width: context.width * 0.25,
            child: Align(alignment: Alignment.center, child: Text(text))),
        const Expanded(
          child: Divider(
            color: Colors.white,
            height: 15,
          ),
        )
      ],
    );
  }
}

class MedaglieRowWidget extends StatelessWidget {
  const MedaglieRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MedagliaWidget("Bronzo"),
            MedagliaWidget("Argento"),
            MedagliaWidget("Oro"),
            MedagliaWidget("Platino"),
            MedagliaWidget("Diamante"),
          ]),
    );
  }
}

class MedagliaWidget extends StatelessWidget {
  final String text;
  const MedagliaWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MIcon(
          name: "Medal icon ${text.toLowerCase()}",
          size: 50,
        ),
        Text(text)
      ],
    );
  }
}

class CoccardeWrapWidget extends StatelessWidget {
  const CoccardeWrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
        child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 16),
            padding: EdgeInsets.zero,
            children: Constants.filterBoxes["Tipo"]!.reversed
                .map<Widget>((String e) => CoccardaWidget(e))
                .toList()),
      ),
    );
  }
}

class CoccardaWidget extends StatelessWidget {
  final String text;
  const CoccardaWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            children: [
              Positioned.fill(
                  child: CircularProgressIndicator(
                value: 0.9,
              )),
              Center(
                child: MIcon(
                  name: "Cockade icon argetno",
                  size: 30,
                ),
              )
            ],
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
