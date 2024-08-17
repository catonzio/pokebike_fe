import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/garage/views/collezione/collezione_widget.dart';
import 'package:pokebike/app/modules/garage/views/garage/garage_widget.dart';
import 'package:pokebike/app/modules/garage/views/pagination/pagination_row.dart';
import 'package:pokebike/app/modules/garage/views/profile_widget.dart';
import 'package:pokebike/app/modules/moto-details/moto_details_arguments.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/garage_controller.dart';

class GarageView extends GetView<GarageController> {
  const GarageView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      backButton: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _mainBody(context),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: context.height * 0.4,
          snap: false,
          pinned: false,
          floating: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Obx(() => Skeletonizer(
                      enabled: controller.user.value == null,
                      child: controller.user.value != null
                          ? ProfileWidget(
                              radius: context.height * 0.06,
                              text: fullName(controller.user.value!),
                              imagePath: controller.user.value!.avatar,
                            )
                          : const SizedBox.shrink(),
                    )),
                const PaginationRow(),
                SearchRow(
                  onSearchField: _onSearchField,
                ),
              ],
            ),
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: controller.refreshList,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
          sliver: Obx(() => controller.isShowingGarage.value
              ? GarageWidget(
                  onTapElement: (Moto m) => _onTapElement(context, m))
              : CollezioneWidget(
                  onTapElement: (Moto? m) => _onTapElement(context, m))),
        )
      ],
    );
  }

  void _onTapElement(BuildContext context, Moto? m) {
    final bool isGarage = controller.isShowingGarage.value;
    if (m != null) {
      context.navigator
          .pushNamed(Routes.MOTO_DETAILS,
              arguments: MotoDetailsArguments(moto: m, isOwnMoto: true))
          .then((value) => controller.isShowingGarage.value = isGarage);
    }
  }

  void _onSearchField(String value) {
    controller.filterGarages(value);
  }
}
