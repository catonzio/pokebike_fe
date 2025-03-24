import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';

class EmptyGarageBody extends StatelessWidget {
  final Future<void> Function() onRefresh;
  const EmptyGarageBody({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Center(
          child: Text('noMotoAdded'.tr, style: context.textTheme.titleMedium),
        ),
        SizedBox(
          height: context.height * 0.1,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.05),
          child: MButton.red(
            onPressed: () => context.pushNamed(Routes.FOTOCAMERA),
            child: Text('add'.tr),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.1),
          child: MButton.white(
            onPressed: onRefresh,
            child: Text(
              'refresh'.tr,
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
