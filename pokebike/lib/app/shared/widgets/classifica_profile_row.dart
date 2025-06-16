import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/classifica_tile/classifica_tile.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/modules/profile/profile_arguments.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';
import 'package:moto_hunters/generated/l10n.dart';

class ClassificaProfileRow extends StatelessWidget {
  final ClassificaTile classificaTile;
  final bool shouldNavigate;

  const ClassificaProfileRow(
      {super.key, required this.classificaTile, this.shouldNavigate = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => shouldNavigate
          ? Get.context!.pushNamed(Routes.PROFILE,
              arguments: ProfileArguments(profileId: classificaTile.id))
          : null,
      child: Container(
          decoration: BoxDecoration(
              color: Get.context!.theme.primaryColor,
              borderRadius: BorderRadius.circular(16),
              border: const Border.symmetric(
                  vertical: BorderSide(color: MColors.secondary, width: 0.5)),
              boxShadow: const [
                BoxShadow(
                    color: MColors.secondary,
                    blurRadius: 1,
                    spreadRadius: 0.2,
                    offset: Offset(1, 1))
              ]),
          padding: const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      classificaTile.position.toString(),
                      maxLines: 1,
                      style: Get.context!.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: MimageNetwork(
                    path: classificaTile.user.avatar?.url ?? '',
                    borderRadius: BorderRadius.circular(8.0),
                    cacheHeight: 128,
                    cacheWidth: 128,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(fullName(classificaTile.user)),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S
                        .of(Get.context!)
                        .points(classificaTile.puntiTotali.toString()),
                    style: Get.context!.textTheme.labelSmall,
                  ),
                ),
              ])),
    );
  }
}
