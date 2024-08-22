import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';

import 'package:pokebike/app/modules/moto-details/views/moto_details_info.dart';
import 'package:pokebike/app/modules/moto-details/views/moto_details_info_edit.dart';
import 'package:pokebike/app/modules/moto-details/views/moto_details_stato.dart';
import 'package:pokebike/app/modules/moto-details/views/moto_main_photo.dart';
import 'package:pokebike/app/modules/moto-details/views/pagination_row.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

import '../controllers/moto_details_controller.dart';

class MotoDetailsView extends StatelessWidget {
  const MotoDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MotoDetailsController>(
      builder: (controller) {
        return DefaultPage(
            backButton: true,
            backgroundColor: Colors.black,
            bottomAppbarActions:
                controller.isShowingInfo.value && controller.isOwnMoto
                    ? [
                        Obx(() => MIcon(
                              name:
                                  "Edit icon ${controller.isEditingMoto.value ? 'red' : 'white'}",
                              onTap: controller.toggleEditingMoto,
                            ))
                      ]
                    : null,
            body: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment.bottomCenter,
                      radius: 1.2,
                      colors: [
                    MColors.secondary.withOpacity(0.05),
                    Colors.black
                  ])),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: context.height * 0.25,
                    backgroundColor: Colors.black,
                    snap: false,
                    pinned: false,
                    floating: true,
                    surfaceTintColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      background: MotoMainPhoto(
                        collezioneMoto: controller.collezioneMoto ??
                            CollezioneMoto.fake(0)
                                .copyWith(moto: controller.moto!),
                      ),
                    ),
                  ),
                  controller.moto != null
                      ? SliverPadding(
                          padding: EdgeInsets.only(
                              bottom: context.keyboardHeight == 0
                                  ? Constants.bottomNavbarHeight
                                  : context.keyboardHeight),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Center(
                                  child: Text(
                                    controller.moto!.nome,
                                    style: context.textTheme.displaySmall,
                                  ),
                                ),
                                const PaginationRow(),
                                Padding(
                                    padding: const EdgeInsets.only(top: 32),
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: controller.isShowingInfo.value
                                          ? controller.isEditingMoto.value
                                              ? const MotoDetailsInfoEdit()
                                              : MotoDetailsInfo(
                                                  moto: controller.moto!)
                                          : MotoDetailsStato(
                                              moto: controller.moto!),
                                    ))
                              ],
                            ),
                          ),
                        )
                      : SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverToBoxAdapter(
                            child: CollezioneMotoDetailsInfo(
                                collezioneMoto: controller.collezioneMoto!),
                          ),
                        )
                ],
              ),
            ));
      },
    );
  }
}
