import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/shared/widgets/mcircular_avatar.dart';
import 'package:moto_hunters/app/modules/profile/profile_arguments.dart';
import 'package:moto_hunters/app/modules/profile/views/classifica/classifica_body.dart';
import 'package:moto_hunters/app/modules/profile/views/classifica/empty_classifica_body.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/medaglie_body.dart';
import 'package:moto_hunters/app/modules/profile/views/medaglie/medaglie_row_widget.dart';
import 'package:moto_hunters/app/modules/settings/controllers/settings_controller.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/pagination/pagination_row.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/profile_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
                  onTap: () => Get.context!.navigator
                      .pushNamed(Routes.SETTINGS,
                          arguments: controller.user.value)
                      .then((value) => controller.user.value =
                          SettingsController.to.user.value),
                )
              ]
            : null,
        backButton: !controller.isOwnProfile.value,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
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
                          height: Get.context!.height * 0.15,
                          child: ProfileHeader(
                              user: controller.user.value,
                              isCurrentUser: controller.isOwnProfile.value)),
                    ),
                    PaginationRow(key: UniqueKey(), items: controller.items),
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
  final bool isCurrentUser;
  const ProfileHeader(
      {super.key, required this.user, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    if (user == null) return const SizedBox();
    int? numMotoCatturate = user!.profile?.numMotoCatturate;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MCircularAvatar(
          radius: Get.context!.width * 0.1,
          avatar: user!.avatar,
          canReport: !isCurrentUser,
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
                    style: Get.context!.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                    S
                        .of(context)
                        .numMotosCaptured(numMotoCatturate?.toString() ?? '-'),
                    style: Get.context!.textTheme.bodyLarge),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  message: S
                      .of(context)
                      .medal(medagliaName(numMotoCatturate ?? 0).name.tr),
                  child: MIcon(
                    name:
                        "Medal icon ${medagliaName(numMotoCatturate ?? 0).iconName}"
                            .trim(),
                    size: Size(Get.context!.width, Get.context!.height)
                            .shortestSide *
                        0.1,
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
      height: Get.context!.height * 0.49,
      child: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: controller.isMedaglie
              ? const MedaglieBody()
              : (controller.numPartecipazioni > 0 ||
                      controller.isLoadingClassifica.value
                  ? const ClassificaBody()
                  : EmptyClassificaBody(
                      isOwnProfile: controller.isOwnProfile.value,
                    )),
        ),
      ),
    );
  }
}
