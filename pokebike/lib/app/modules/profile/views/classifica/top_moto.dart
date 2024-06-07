import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class TopMoto extends StatelessWidget {
  const TopMoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text("TOP MOTO",
              style: context.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: context.height * 0.11,
          child: ListView(
            itemExtent: context.width * 0.3,
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: MColors.primaryLight,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("1"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: MColors.primaryLight,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("2"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: MColors.primaryLight,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("3"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: MColors.primaryLight,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("4"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
