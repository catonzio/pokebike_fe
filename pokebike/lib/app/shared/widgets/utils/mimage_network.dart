import 'package:flutter/material.dart';

class MimageNetwork extends StatelessWidget {
  final String path;

  const MimageNetwork({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      fit: BoxFit.cover,
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
