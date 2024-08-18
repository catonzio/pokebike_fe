import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/garage/views/collezione/collezione_widget.dart';
import 'package:pokebike/app/modules/garage/views/garage/garage_widget.dart';
import 'package:pokebike/app/modules/garage/views/pagination/pagination_row.dart';
import 'package:pokebike/app/modules/garage/views/profile_widget.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/sliver_refresh.dart';
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
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast),
      // physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: context.height * 0.285,
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
              ],
            ),
          ),
        ),
        SliverRefresh(onRefresh: controller.refreshList),
        Obx(() => controller.isShowingGarage.value
            ? const GarageWidget()
            : const CollezioneWidget())
      ],
    );
  }
}
