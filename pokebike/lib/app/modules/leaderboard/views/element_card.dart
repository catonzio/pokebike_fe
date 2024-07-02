import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';

class ElementCard extends StatelessWidget {
  final Partecipazione element;
  const ElementCard({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final double width = context.width * 0.42;
    final double height = context.height * 0.22;
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: MColors.primary,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: Image.network(element.avatar).image, fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    border: Border.all(color: MColors.secondary, width: 2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(16),
                child: Text(
                  element.id.toString(),
                  style: context.textTheme.titleLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DefaultTextStyle(
              style: context.textTheme.bodyLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      element.fullName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(element.punti.toString()),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
