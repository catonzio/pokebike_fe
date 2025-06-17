import 'package:flutter/material.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/widgets/mcircular_avatar.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  final String text;
  final ApiMedia? image;
  final double radius;

  const ProfileWidget({
    super.key,
    required this.radius,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Material(
        //   shape: const CircleBorder(),
        //   child: Container(
        //     padding: const EdgeInsets.all(8),
        //     decoration: const BoxDecoration(
        //       shape: BoxShape.circle,
        //       gradient: LinearGradient(
        //         colors: [
        //           MColors.primary,
        //           MColors.secondary,
        //         ],
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //       ),
        //     ),
        //     child: CircleAvatar(
        //       radius: radius,
        //       backgroundColor: Colors.black,
        //       foregroundImage: Image.network(
        //         imagePath,
        //       ).image,
        //     ),
        //   ),
        // ),
        MCircularAvatar(
          radius: radius,
          avatar: image,
          padding: 8,
        ),
        ShimmerTitle.light(
          text: text,
        )
      ],
    );
  }
}
