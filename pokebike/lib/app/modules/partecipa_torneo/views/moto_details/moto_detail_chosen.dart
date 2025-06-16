import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/mbutton.dart';
import 'package:moto_hunters/generated/l10n.dart';

class MotoDetailChosen extends StatelessWidget {
  const MotoDetailChosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16, right: 16, bottom: Get.context!.height * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            S.of(context).motoRegistered,
            style: Get.context!.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          MButton(label: S.of(context).backHome, onTap: () => _tornaAllaHome(context))
        ],
      ),
    );
  }

  void _tornaAllaHome(BuildContext context) {
    // controller.reset();
    Get.context!.navigator.pushReplacementNamed(Routes.HOME);
  }
}
