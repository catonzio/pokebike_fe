import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MimageNetwork extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const MimageNetwork(
      {super.key,
      required this.path,
      this.fit = BoxFit.cover,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: path,
        fit: fit,
        progressIndicatorBuilder: (context, url, progress) => Container(
          color: MColors.primaryLight,
          child: Center(
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
