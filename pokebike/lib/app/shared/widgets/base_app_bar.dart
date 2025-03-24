import 'package:flutter/material.dart';
import 'package:moto_hunters/app/shared/widgets/back_button.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onBackPressed;

  const BaseAppBar({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        leading: MBackButton(
          onPressed: onBackPressed,
        ));
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
