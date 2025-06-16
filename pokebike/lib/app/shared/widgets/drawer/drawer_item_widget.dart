import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/widgets/drawer/drawer_item.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItem item;
  final Function() onTap;

  const DrawerItemWidget({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: Get.context!.width * 0.13,
              alignment: Alignment.centerLeft,
              child: MIcon(name: item.icon)),
          Text(item.title)
        ],
      ),
    );
  }
}
