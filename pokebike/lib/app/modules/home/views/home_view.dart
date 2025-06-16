import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
// import 'package:moto_hunters/app/modules/home/views/stories/stories_widget.dart';
import 'package:moto_hunters/app/modules/home/views/tornei/tornei_widget.dart';
import 'package:moto_hunters/app/modules/home/views/upper_buttons/upper_buttons.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';

import '../controllers/home_controller.dart';
import 'community/community_widget.dart';
import 'package:moto_hunters/generated/l10n.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final double storiesHeight = Get.context!.height * 0.2;
    final double upperButtonsHeight = Get.context!.height * 0.3;
    final double communityHeight = Get.context!.height * 0.25;

    return DefaultPage(
        body: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerTitle.light(
              text: S.of(context).helloBiker,
            ),
            // StoriesWidget(height: storiesHeight),
            SizedBox(
              height: upperButtonsHeight,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: UpperButtons(),
              ),
            ),
            CommunityWidget(
              height: communityHeight,
            ),
            TorneiWidget(
              height: communityHeight,
            )
          ],
        ),
      ),
    ));
  }
}
