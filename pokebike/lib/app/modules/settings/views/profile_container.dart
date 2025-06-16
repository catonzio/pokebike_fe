import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/widgets/mcircular_avatar.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

class ProfileContainer extends StatelessWidget {
  final ApiMedia? avatar;
  final String name;
  final Function() onPressed;

  const ProfileContainer(
      {super.key,
      required this.avatar,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: MCircularAvatar(
          avatar: avatar,
          radius: 32,
          // backgroundImage: NetworkImage(imagePath),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        tileColor: MColors.primaryLight,
        isThreeLine: false,
        dense: false,
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.maximumDensity),
        minLeadingWidth: Get.context!.width * 0.2,
        // minTileHeight: Get.context!.height * 0.06,
        title: Text(
          name,
          style: Get.context!.textTheme.titleLarge,
        ),
        trailing: const MIcon(name: "Edit icon white"),
        onTap: onPressed);
  }
}
