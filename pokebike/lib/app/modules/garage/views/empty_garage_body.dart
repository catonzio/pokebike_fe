import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/views/aggiungi_button.dart';

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
          child: AggiungiButton(
            onTap: () => {print("Aggiungi garage")},
          ),
        )
      ],
    );
  }
}