import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/generated/l10n.dart';

class EmptyPartecipaTorneoGrid extends StatelessWidget {
  const EmptyPartecipaTorneoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          S.of(context).noCollecting,
          style: Get.context!.textTheme.titleMedium,
        ),
        MButton.red(
            onPressed: () => Get.context!.pushNamed(Routes.FOTOCAMERA),
            child: Text(S.of(context).startCollecting)),
      ],
    );
  }
}
