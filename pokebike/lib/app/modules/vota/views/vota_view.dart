import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/models/partecipazione/partecipazione.dart';
import 'package:moto_hunters/app/modules/vota/views/vota_row.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/widgets/utils/loading_stack.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/vota_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class VotaView extends GetView<VotaController> {
  const VotaView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        backButton: true,
        title: S.of(context).vote,
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
                    style: Get.context!.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  )),
                  child: Column(
                    children: [
                      VotaRow(
                        partecipazione:
                            controller.turno.value?.partecipazione1 ??
                                Partecipazione.fake(1),
                        reversed: false,
                      ),
                      Text(
                        "VS",
                        style: Get.context!.textTheme.displaySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.3),
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
