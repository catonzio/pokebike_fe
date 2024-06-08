import 'package:flutter/material.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class GarageCardWidget extends StatelessWidget {
  final int index;
  final Function() onTap;
  const GarageCardWidget({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: MimageNetwork(
          path: MImageProvider.getImageUrl(index: index)),
        ),
      );
  }
}
