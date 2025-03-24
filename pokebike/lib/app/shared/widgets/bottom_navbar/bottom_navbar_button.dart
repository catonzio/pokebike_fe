import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/shared/widgets/bottom_navbar/navbar_item.dart';
// import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

class BottomNavbarButton extends StatelessWidget {
  final int index;
  final RxInt currentIndex;
  final Color selectedColor;
  final Color unselectedColor;
  final NavbarItem item;
  final Function(int) onTap;

  const BottomNavbarButton({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.item,
    required this.onTap,
    this.selectedColor = MColors.secondary,
    this.unselectedColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = item.routes != null && item.routes!.isNotEmpty
        ? item.routes!.contains(Get.currentRoute)
        : Get.currentRoute == item.route;
    // final Color color = isSelected ? selectedColor : unselectedColor;
    final String addName = isSelected ? " red" : "";
    // item.iconName.toLowerCase().contains("foto")
    Widget mIcon = MIcon(
      name: item.iconName + addName,
      onTap: () => onTap(index),
      padding: const EdgeInsets.all(0),
      // color: color,
      size: item.size,
    );
    // mIcon = item.iconName.toLowerCase().contains("logo")
    //     ? Transform.translate(
    //         offset: Offset(4, 0),
    //         child: mIcon,
    //       )
    //     : mIcon;
    // return mIcon;
    return Container(
      width: context.width * 0.9 * 0.2,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // MIcon(
          //   name: item.iconName + addName,
          //   onTap: () => onTap(index),
          //   // color: color,
          //   size: item.size,
          // ),
          mIcon,
          AutoSizeText(
            item.label,
            maxLines: 1,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: isSelected ? selectedColor : unselectedColor),
          )
        ],
      ),
    );
  }
}
