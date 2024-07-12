import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/profile/profile.dart';
import 'package:pokebike/app/modules/profile/controllers/profile_controller.dart';
import 'package:pokebike/app/modules/profile/views/classifica/indicator.dart';

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (ProfileController controller) {
        Profile? profile = controller.user.value?.profile;
        int numeroVittorie = profile?.numVittorie ?? 0;
        int numeroSconfitte = profile?.numSconfitte ?? 0;
        int numeroPartecipazioni = numeroVittorie + numeroSconfitte;

        return Column(
          children: [
            StatisticsElement(
                text: "Vittorie",
                value: numeroVittorie,
                percentage: numeroVittorie / numeroPartecipazioni),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: StatisticsElement(
                  text: "Sconfitte",
                  value: numeroSconfitte,
                  percentage: numeroSconfitte / numeroPartecipazioni),
            ),
          ],
        );
      },
    );
  }
}

class StatisticsElement extends StatelessWidget {
  final String text;
  final int value;
  final double percentage;

  const StatisticsElement(
      {super.key,
      required this.text,
      required this.value,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(text),
              Text("$value"),
            ],
          ),
        ),
        Indicator(percentage: percentage)
      ],
    );
  }
}
