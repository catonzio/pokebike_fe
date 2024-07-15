import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/profile/views/classifica/indicator.dart';

class StatisticsRow extends StatelessWidget {
  final int numeroVittorie;
  final int numeroSconfitte;
  final bool boxShadow;

  const StatisticsRow(
      {super.key,
      required this.numeroVittorie,
      required this.numeroSconfitte,
      this.boxShadow = true});

  @override
  Widget build(BuildContext context) {
    int numeroPartecipazioni = numeroVittorie + numeroSconfitte;

    return Column(
      children: [
        StatisticsElement(
          text: "Vittorie",
          value: numeroVittorie,
          percentage: numeroVittorie / numeroPartecipazioni,
          boxShadow: boxShadow,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: StatisticsElement(
            text: "Sconfitte",
            value: numeroSconfitte,
            percentage: numeroSconfitte / numeroPartecipazioni,
            boxShadow: boxShadow,
          ),
        ),
      ],
    );
  }
}

class StatisticsElement extends StatelessWidget {
  final String text;
  final int value;
  final double percentage;
  final bool boxShadow;

  const StatisticsElement(
      {super.key,
      required this.text,
      required this.value,
      required this.percentage,
      this.boxShadow = true});

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
        Indicator(
          percentage: percentage,
          boxShadow: boxShadow,
        )
      ],
    );
  }
}
