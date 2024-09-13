import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_photo.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class StoryWidget extends StatelessWidget {
  final String? text;
  final double radius;
  final String imagePath;
  final Function()? onTap;

  const StoryWidget(
      {super.key,
      this.radius = 150,
      required this.imagePath,
      this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: imagePath,
          child: Material(
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () => _onTap(context),
              customBorder: const CircleBorder(),
              child: Container(
                  padding: const EdgeInsets.all(4),
                  width: radius * 2,
                  height: radius * 2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        MColors.primary,
                        MColors.secondary,
                      ],
                      stops: [0, 0.8],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: InteractiveViewer(
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      imageBuilder: (context, imageProvider) {
                        return CircleAvatar(
                          radius: radius,
                          backgroundColor: Colors.black,
                          foregroundImage: imageProvider,
                        );
                      },
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                    ),
                  )
                  // CircleAvatar(
                  //   radius: radius,
                  //   backgroundColor: Colors.black,
                  //   foregroundImage: Image.network(imagePath,
                  //       frameBuilder:
                  //           (context, child, frame, wasSynchronouslyLoaded) =>
                  //               child,

                  //       loadingBuilder: (context, child, loadingProgress) {
                  //         final double progress =
                  //             (loadingProgress?.cumulativeBytesLoaded ?? 1) /
                  //                 (loadingProgress?.cumulativeBytesLoaded ?? 1);
                  //         return CircularProgressIndicator(value: progress);
                  //       }).image,
                  // ),
                  ),
            ),
          ),
        ),
        if (text != null)
          Text(
            text!,
            overflow: TextOverflow.ellipsis,
          )
      ],
    );
  }

  _onTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
    }
    context.navigator.push(
      MaterialPageRoute(
          builder: (context) =>
              MotoDetailPhoto(tag: imagePath, avatarUrl: imagePath)),
    );
  }
}
