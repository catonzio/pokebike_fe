import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/shared/widgets/mcircular_avatar.dart';
import 'package:pokebike/app/modules/profile/profile_arguments.dart';
import 'package:pokebike/app/modules/profile/views/classifica/classifica_body.dart';
import 'package:pokebike/app/modules/profile/views/classifica/empty_classifica_body.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/medaglie_body.dart';
import 'package:pokebike/app/modules/profile/views/medaglie/medaglie_row_widget.dart';
import 'package:pokebike/app/modules/settings/controllers/settings_controller.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_row.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> initState(GetXState<ProfileController> state) async {
    // state.controller?.setUser(argumentUser);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ProfileArguments? argumentUser = Get.arguments as ProfileArguments?;
      // Make sure this is called after the widget is fully built
      await state.controller?.initialize(argumentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
      initState: initState,
      builder: (controller) {
        return buildPage(context, controller);
      },
    );
  }

  DefaultPage buildPage(BuildContext context, ProfileController controller) {
    return DefaultPage(
        actions: controller.isOwnProfile.value
            ? [
                MIcon(
                  name: "Option icon",
                  onTap: () => context.navigator
                      .pushNamed(Routes.SETTINGS,
                          arguments: controller.user.value)
                      .then((value) => controller.user.value =
                          SettingsController.to.user.value),
                )
              ]
            : null,
        backButton: !controller.isOwnProfile.value,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Skeletonizer(
                enabled: controller.isFetchingUser.value ||
                    controller.isFetchingProfile.value ||
                    controller.user.value == null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: context.height * 0.15,
                          child: ProfileHeader(user: controller.user.value)),
                    ),
                    PaginationRow(items: controller.items),
                    const ProfileBody()
                    // NavigationBar()
                  ],
                ),
              )),
        ));
  }
}

class ProfileHeader extends StatelessWidget {
  final User? user;
  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    if (user == null) return const SizedBox();
    int? numMotoCatturate = user!.profile?.numMotoCatturate;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MCircularAvatar(
          radius: context.width * 0.1,
          imagePath: user!.avatar,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShimmerTitle.light(
                    text: fullName(user!),
                    // colors: [Colors.white, Colors.grey, Colors.white],
                    style: context.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                    'numMotosCaptured'.trParams(
                        {'howMany': numMotoCatturate?.toString() ?? '-'}),
                    style: context.textTheme.bodyLarge),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  message: 'medal'.trParams(
                      {'name': medagliaName(numMotoCatturate ?? 0).name.tr}),
                  child: MIcon(
                    name:
                        "Medal icon ${medagliaName(numMotoCatturate ?? 0).iconName}"
                            .trim(),
                    size:
                        Size(context.width, context.height).shortestSide * 0.1,
                  ),
                )
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
            child: controller.isMedaglie
                ? const MedaglieBody()
                : (controller.numPartecipazioni > 0 ||
                        controller.isLoadingClassifica.value
                    ? const ClassificaBody()
                    : EmptyClassificaBody(
                        isOwnProfile: controller.isOwnProfile.value,
                      )))));
  }
}
