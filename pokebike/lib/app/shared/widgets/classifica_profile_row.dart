import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
import 'package:pokebike/app/modules/profile/profile_arguments.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class ClassificaProfileRow extends StatelessWidget {
  final int index;
  final Partecipazione partecipazione;

  const ClassificaProfileRow(
      {super.key, required this.index, required this.partecipazione});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigator.pushNamed(Routes.PROFILE,
          arguments: ProfileArguments(profileId: partecipazione.profileId)),
      child: Container(
          decoration: BoxDecoration(
              color: context.theme.primaryColor,
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
                      index.toString(),
                      maxLines: 1,
                      style: context.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: MimageNetwork(
                    path: partecipazione.avatar,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(partecipazione.fullName),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Punti ${partecipazione.punti}",
                    style: context.textTheme.labelSmall,
                  ),
                ),
              ])),
    );
  }
}
