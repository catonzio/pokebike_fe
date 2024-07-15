import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
import 'package:pokebike/app/modules/profile/profile_arguments.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class ElementCard extends StatelessWidget {
  final int index;
  final Partecipazione element;

  const ElementCard({super.key, required this.index, required this.element});

  @override
  Widget build(BuildContext context) {
    final double width = context.width * 0.42;
    final double height = context.height * 0.22;
    return GestureDetector(
      onTap: () => context.navigator.pushNamed(Routes.PROFILE,
          arguments: ProfileArguments(profileId: element.profileId)),
      child: Container(
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
                    index.toString(),
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
                      Expanded(
                        flex: 8,
                        child: AutoSizeText(
                          element.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: AutoSizeText(element.punti.toString(),
                              textAlign: TextAlign.end, maxLines: 1)),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
