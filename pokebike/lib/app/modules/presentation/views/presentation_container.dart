import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';

class PresentationContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double height;
  final Function() onNext;

  const PresentationContainer(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.height,
      required this.onNext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onNext,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          // child: Container(child: MimageNetwork(path: imagePath)),
          child: Container(
            key: ValueKey(imagePath),
            width: context.width,
            height: height,
            decoration: BoxDecoration(
                // image: getDarkDecorationImageApi(imagePath, 0.2),
                // borderRadius: const BorderRadius.only(
                //   bottomRight: Radius.circular(100),
                // ),
                ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(100),
                      ),
                      child: MimageNetwork(
                        path: imagePath,
                        lightLevel: 0.7,
                        cacheWidth: 1080,
                        cacheHeight: 2018,
                      )),
                ),
                InternalText(title: title, subtitle: subtitle),
              ],
            ),
          ),
        ));
  }
}

class InternalText extends StatelessWidget {
  const InternalText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerTitle.dark(text: title),
          // Text(
          //   title,
          //   style: context.textTheme.displaySmall
          //       ?.copyWith(fontWeight: FontWeight.bold),
          // ),
          ...[
            for (String text in subtitle.split("\n"))
              Text(text, style: context.textTheme.bodyLarge)
          ]
        ],
      ),
    );
  }
}
