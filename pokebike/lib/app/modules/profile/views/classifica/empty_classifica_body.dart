import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/modules/profile/controllers/profile_controller.dart';

class EmptyClassificaBody extends StatelessWidget {
  const EmptyClassificaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "Non hai ancora partecipato a nessun torneo",
          textAlign: TextAlign.center,
        ),
        MButton(
            onPressed: () => Get.find<ProfileController>().setTorneo(Torneo()),
            backgroundColor: MColors.secondaryDark,
            child: const Text("Partecipa al torneo"))
      ],
    );
  }
}
