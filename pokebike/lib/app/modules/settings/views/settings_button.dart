import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final String? iconName;
  final Widget? icon;
  final Widget trailing;
  final Function()? onPressed;

  const SettingsButton(
      {super.key,
      required this.text,
      this.iconName,
      this.icon,
      required this.trailing,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: icon ?? MIcon(name: "$iconName icon white"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        tileColor: MColors.primaryLight,
        isThreeLine: false,
        dense: false,
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        // minLeadingWidth: Get.context!.width * 0.2,
        // minTileHeight: Get.context!.height * 0.02,
        title: Text(
          text,
          style: Get.context!.textTheme.bodyLarge,
        ),
        trailing: trailing,
        onTap: onPressed);
  }
}
