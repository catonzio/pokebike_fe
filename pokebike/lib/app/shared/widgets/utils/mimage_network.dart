import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';

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
  final double lightLevel;
  final double? cacheWidth;
  final double? cacheHeight;

  const MimageNetwork(
      {super.key,
      required this.path,
      this.fit = BoxFit.cover,
      this.borderRadius,
      this.lightLevel = 1,
      this.cacheHeight,
      this.cacheWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: Constants.isLocal && path.startsWith('http://localhost:8080')
            ? path.replaceFirst('http://localhost:8080', Constants.baseUrl)
            : path,
        fit: fit,
        alignment: Alignment.center,
        width: cacheWidth,
        height: cacheHeight,
        maxWidthDiskCache: cacheWidth?.toInt(),
        maxHeightDiskCache: cacheHeight?.toInt(),
        color: lightLevel < 1
            ? Colors.black.withValues(alpha: 1 - lightLevel)
            : null,
        colorBlendMode: lightLevel < 1 ? BlendMode.darken : null,
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
        //     child: MCircularProgressIndicator(
        //       value: progress.progress,
        //     ),
        //   ),
        // ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
