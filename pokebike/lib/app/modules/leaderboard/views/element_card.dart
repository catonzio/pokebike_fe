import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/classifica_tile/classifica_tile.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/modules/profile/profile_arguments.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';

class ElementCard extends StatelessWidget {
  final int index;
  final ClassificaTile element;

  const ElementCard({super.key, required this.index, required this.element});

  @override
  Widget build(BuildContext context) {
    final double width = Get.context!.width * 0.42;
    final double height = Get.context!.height * 0.22;
    return GestureDetector(
      onTap: () => Get.context!.pushNamed(Routes.PROFILE,
          arguments: ProfileArguments(profileId: element.id)),
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: MColors.primary,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: Image.network(
                  element.user.avatar?.url ?? '',
                  cacheHeight: 500,
                  cacheWidth: 500,
                ).image,
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      border: Border.all(color: MColors.secondary, width: 2),
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    index.toString(),
                    style: Get.context!.textTheme.titleLarge?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              DefaultTextStyle(
                style: Get.context!.textTheme.bodyLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 8,
                        child: AutoSizeText(
                          fullName(element.user),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: AutoSizeText(element.puntiTotali.toString(),
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
