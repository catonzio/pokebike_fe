import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';

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
            onPressed: () => context.pushNamed(Routes.FOTOCAMERA),
            child: Text('startCollecting'.tr)),
      ],
    );
  }
}
