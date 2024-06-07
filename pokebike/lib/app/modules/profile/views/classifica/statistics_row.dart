import 'package:flutter/material.dart';
import 'package:pokebike/app/modules/profile/views/classifica/indicator.dart';

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text("Vittorie"),
            Spacer(),
            Text("20"),
            Spacer(),
            Indicator(percentage: 0.35)
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Text("Tornei"),
              Spacer(),
              Text("48"),
              Spacer(),
              Indicator(percentage: 0.48)
            ],
          ),
        )
      ],
    );
  }
}
