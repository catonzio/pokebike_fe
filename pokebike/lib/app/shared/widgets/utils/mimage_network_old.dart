import 'package:flutter/material.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';

class MimageNetworkOld extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const MimageNetworkOld(
      {super.key,
      required this.path,
      this.fit = BoxFit.cover,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.network(
        path,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            color: MColors.primaryLight,
            child: Center(
              child: MCircularProgressIndicator(
                value: loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.center, child: Text(error.toString())),
          );
        },
      ),
    );
  }
}
