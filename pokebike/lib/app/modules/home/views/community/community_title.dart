import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

class CommunityTitle extends StatelessWidget {
  final Function() onTap;
  const CommunityTitle({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShimmerTitle.light(
            text: "Community",
            style: context.textTheme.headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              "Vedi Tutti",
              style: context.textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
