import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';

class CommunityTitle extends StatelessWidget {
  final Function()? onTap;
  const CommunityTitle({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: onTap != null
          ? const EdgeInsets.only(right: 16.0)
          : const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShimmerTitle.light(
            text: 'community'.tr,
            style: context.textTheme.headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          if (onTap != null)
            InkWell(
              onTap: onTap,
              child: Text(
                'seeAll'.tr,
                style: context.textTheme.bodySmall,
              ),
            )
        ],
      ),
    );
  }
}
