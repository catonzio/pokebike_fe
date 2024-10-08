import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';

class EmptyGarageBody extends StatelessWidget {
  const EmptyGarageBody({super.key});

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
          padding: EdgeInsets.only(bottom: context.height * 0.1),
          child: MButton(
            label: 'add'.tr,
            onTap: () => context.navigator.pushNamed(Routes.FOTOCAMERA),
          ),
        )
      ],
    );
  }
}
