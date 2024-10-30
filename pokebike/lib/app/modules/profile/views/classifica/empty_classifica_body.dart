import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class EmptyClassificaBody extends StatelessWidget {
  const EmptyClassificaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'noTournamentsPartecipations'.tr,
          textAlign: TextAlign.center,
        ),
        MButton(
            onPressed: () => context.navigator.pushNamed(Routes
                .PARTECIPA_TORNEO), // Get.find<ProfileController>().setTorneo(Torneo()),
            backgroundColor: MColors.secondaryDark,
            child: Text('partecipateTournaments'.tr))
      ],
    );
  }
}
