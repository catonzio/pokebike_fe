import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
import 'package:pokebike/app/modules/vota/views/vota_row.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/utils/loading_stack.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/vota_controller.dart';

class VotaView extends GetView<VotaController> {
  const VotaView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        backButton: true,
        title: 'vote'.tr,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
              16.0, 16.0, 16.0, Constants.bottomNavbarHeight),
          child: Obx(() => Skeletonizer(
              enabled: controller.isFetchingTurno,
              child: LoadingStack(
                  sigmaX: 8,
                  sigmaY: 8,
                  isLoading: (controller.turno.value == null).obs,
                  topper: Center(
                      child: Text(
                    controller.errorMessage,
                    style: context.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  )),
                  child: Column(
                    children: [
                      VotaRow(
                        partecipazione:
                            controller.turno.value?.partecipazione1 ??
                                Partecipazione.fake(1),
                      ),
                      Text(
                        "VS",
                        style: context.textTheme.displaySmall?.copyWith(
                          color: Colors.white.withOpacity(0.3),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      VotaRow(
                        partecipazione:
                            controller.turno.value?.partecipazione2 ??
                                Partecipazione.fake(2),
                        reversed: true,
                      )
                    ],
                  )))),
        ));
  }
}
