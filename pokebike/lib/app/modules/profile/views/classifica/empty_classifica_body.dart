import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class EmptyClassificaBody extends StatelessWidget {
  final bool isOwnProfile;
  const EmptyClassificaBody({super.key, required this.isOwnProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          isOwnProfile
              ? 'youNoTournamentsPartecipations'.tr
              : 'heNoTournamentsPartecipations'.tr,
          textAlign: TextAlign.center,
        ),
        if (isOwnProfile)
          MButton(
              onPressed: () => context.pushNamed(Routes
                  .PARTECIPA_TORNEO), // Get.find<ProfileController>().setTorneo(Torneo()),
              backgroundColor: MColors.secondaryDark,
              child: Text('partecipateTournaments'.tr))
      ],
    );
  }
}
