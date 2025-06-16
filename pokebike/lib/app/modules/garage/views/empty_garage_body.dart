import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/generated/l10n.dart';

class EmptyGarageBody extends StatelessWidget {
  final Future<void> Function() onRefresh;
  const EmptyGarageBody({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Center(
          child: Text(S.of(context).noMotoAdded, style: Get.context!.textTheme.titleMedium),
        ),
        SizedBox(
          height: Get.context!.height * 0.1,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Get.context!.height * 0.05),
          child: MButton.red(
            onPressed: () => Get.context!.pushNamed(Routes.FOTOCAMERA),
            child: Text(S.of(context).add),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Get.context!.height * 0.1),
          child: MButton.white(
            onPressed: onRefresh,
            child: Text(
              S.of(context).refresh,
              style:
                  Get.context!.textTheme.bodyMedium?.copyWith(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
