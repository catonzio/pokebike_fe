import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/home/controllers/home_controller.dart';
import 'package:pokebike/app/modules/home/views/stories/story_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StoriesWidget extends GetView<HomeController> {
  final double height;

  const StoriesWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Obx(
        () => Skeletonizer(
            enabled: controller.isLoadingStories,
            child: ListView(
                scrollDirection: Axis.horizontal,
                itemExtent: context.width * 0.25,
                children: (controller.isLoadingStories
                        ? controller.fakeStories
                        : controller.stories)
                    .indexed
                    .map(((int, String) e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StoryWidget(
                            index: e.$1,
                            radius: height * 0.3,
                            text: e.$2,
                            onTap: () => "Story ${e.$2} tapped")))
                    .toList())),
      ),
    );
  }
}
