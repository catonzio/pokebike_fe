import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

class ProfileWidget extends StatelessWidget {
  final String text;
  final double radius;

  const ProfileWidget({
    super.key,
    required this.radius,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          shape: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  MColors.primary,
                  MColors.secondary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.black,
              foregroundImage: Image.network(
                "https://picsum.photos/id/237/300",
              ).image,
            ),
          ),
        ),
        ShimmerTitle(
          text: text,
          colors: const [Colors.white, Colors.grey, Colors.white],
        )
      ],
    );
  }
}
