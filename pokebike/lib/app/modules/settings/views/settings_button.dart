import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final String icon;
  final Widget trailing;
  final Function()? onPressed;

  const SettingsButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.trailing,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: MIcon(name: "$icon icon white"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        tileColor: MColors.primaryLight,
        isThreeLine: false,
        dense: false,
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.maximumDensity),
        // minLeadingWidth: context.width * 0.2,
        minTileHeight: context.height * 0.02,
        title: Text(
          text,
          style: context.textTheme.bodyLarge,
        ),
        trailing: trailing,
        onTap: onPressed);
  }
}
