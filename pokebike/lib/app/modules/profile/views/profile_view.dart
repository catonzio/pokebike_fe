import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/home/views/stories/story_widget.dart';
import 'package:pokebike/app/modules/profile/views/classifica/classifica_body.dart';
import 'package:pokebike/app/modules/profile/views/classifica/empty_classifica_body.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/empty_medaglie_body.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/medaglie_body.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_row.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        actions: [
          MIcon(
            name: "Option icon",
            onTap: () => context.navigator.pushNamed(Routes.SETTINGS),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: context.height * 0.15,
                    child: const ProfileHeader()),
              ),
              PaginationRow(items: controller.items),
              const ProfileBody()
              // NavigationBar()
            ],
          ),
        ));
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StoryWidget(
            index: 0, radius: context.width * 0.1, text: "", onTap: () => {}),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShimmerTitle.light(
                    text: "Nome Cognome",
                    // colors: [Colors.white, Colors.grey, Colors.white],
                    style: context.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                Text("15 moto catturate", style: context.textTheme.bodyLarge),
              ]),
        ),
      ],
    );
  }
}

class ProfileBody extends GetView<ProfileController> {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height * 0.56,
        child: Obx(() => AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: controller.isGarage
                ? const Text("Garage") //.animate().fade(duration: 1000.ms)
                : controller.isMedaglie
                    ? (controller.medaglie.isNotEmpty ||
                            controller.isLoadingMedaglie.value
                        ? const MedaglieBody()
                        : const EmptyMedaglieBody())
                    : (controller.torneo.value != null ||
                            controller.isLoadingClassifica.value
                        ? const ClassificaBody()
                        : const EmptyClassificaBody()))));
  }
}
