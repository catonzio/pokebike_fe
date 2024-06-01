import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/community/controllers/community_controller.dart';
import 'package:pokebike/app/shared/widgets/community_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WholeCommunityList extends GetView<CommunityController> {
  const WholeCommunityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Skeletonizer(
          enabled: controller.isLoading,
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              children: (controller.isLoading
                      ? controller.fakeCommunities
                      : controller.communities)
                  .map((int e) => CommunityTile(
                        index: e,
                        text: "Community $e",
                        onTap: () => "Community $e tapped",
                      ))
                  .toList()),
        ));
  }
}
