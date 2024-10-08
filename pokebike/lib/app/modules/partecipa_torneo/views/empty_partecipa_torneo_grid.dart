import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class EmptyPartecipaTorneoGrid extends StatelessWidget {
  const EmptyPartecipaTorneoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'noCollecting'.tr,
          style: context.textTheme.titleMedium,
        ),
        MButton.red(
            onPressed: () => context.navigator.pushNamed(Routes.FOTOCAMERA),
            child: Text('startCollecting'.tr)),
      ],
    );
  }
}
