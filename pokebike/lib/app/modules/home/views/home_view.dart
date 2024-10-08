import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
// import 'package:pokebike/app/modules/home/views/stories/stories_widget.dart';
import 'package:pokebike/app/modules/home/views/tornei/tornei_widget.dart';
import 'package:pokebike/app/modules/home/views/upper_buttons/upper_buttons.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

import '../controllers/home_controller.dart';
import 'community/community_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final double storiesHeight = context.height * 0.2;
    final double upperButtonsHeight = context.height * 0.3;
    final double communityHeight = context.height * 0.25;

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
              text: 'helloBiker'.tr,
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
