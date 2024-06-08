import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/home/controllers/home_controller.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/community_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommunityList extends GetView<HomeController> {
  const CommunityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
          enabled: controller.isLoadingCommunity,
          child: ListView(
            itemExtent: context.width * 0.45,
            scrollDirection: Axis.horizontal,
            children: (controller.isLoadingCommunity
                    ? controller.fakeCommunities
                    : controller.communities)
                .indexed
                .map<Widget>(((int, String) e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommunityTile(
                        index: e.$1,
                        text: e.$2,
                        imagePath: MImageProvider.getImageUrl(index: e.$1),
                        profileImagePath: MImageProvider.getImageUrl(index: e.$1),
                        onTap: () => print("Community $e tapped"),
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}
