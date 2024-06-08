import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';

class EmptyGarageBody extends StatelessWidget {
  const EmptyGarageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Non hai ancora aggiunto moto",
            style: context.textTheme.titleMedium),
        Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.1),
          child: MButton(
            label: "Aggiungi",
            onTap: () => context.navigator.pushNamed(Routes.FOTOCAMERA),
          ),
        )
      ],
    );
  }
}
