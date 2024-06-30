import 'package:flutter/material.dart';

class MimageNetwork extends StatelessWidget {
  final String path;
  final BoxFit fit;
  const MimageNetwork({super.key, required this.path, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Align(alignment: Alignment.center, child: Text(error.toString())),
        );
      },
    );
  }
}
