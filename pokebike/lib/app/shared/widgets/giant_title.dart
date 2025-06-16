import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiantTitle extends StatelessWidget {
  final String title;

  const GiantTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    const double fontSize = 32;
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: fontSize * 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(
                        0.3), // Set the color for the background text
                  ),
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the color for the foreground text
                ),
          ),
        ),
      ],
    );
  }
}
