import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

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
            print("animation: ${animation.value}");
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Container(
            key: ValueKey(imagePath),
            width: context.width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.darken),
                  image: Image.asset(
                    imagePath,
                  ).image),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: InternalText(title: title, subtitle: subtitle),
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
          Text(
            title,
            style: context.textTheme.displaySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          ...[
            for (String text in subtitle.split("\n"))
              Text(text, style: context.textTheme.bodyLarge)
          ]
        ],
      ),
    );
  }
}