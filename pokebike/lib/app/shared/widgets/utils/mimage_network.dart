import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DefaultCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final DefaultCacheManager _instance = DefaultCacheManager._();

  factory DefaultCacheManager() {
    return _instance;
  }

  DefaultCacheManager._() : super(Config(key));
}

class MimageNetwork extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool shouldDarken;

  const MimageNetwork(
      {super.key,
      required this.path,
      this.fit = BoxFit.cover,
      this.borderRadius,
      this.shouldDarken = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: path,
        fit: fit,
        color: shouldDarken ? Colors.black.withOpacity(0.6) : null,
        colorBlendMode: shouldDarken ? BlendMode.darken : null,
        progressIndicatorBuilder: (context, url, progress) => Skeletonizer(
          enabled: true,
          child: LinearProgressIndicator(value: progress.progress),
        ),
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        placeholderFadeInDuration: Duration.zero,
        // Container(
        //   color: MColors.primaryLight,
        //   child: Center(
        //     child: CircularProgressIndicator(
        //       value: progress.progress,
        //     ),
        //   ),
        // ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
