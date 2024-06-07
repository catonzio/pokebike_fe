import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class ClassificaProfileRow extends StatelessWidget {
  const ClassificaProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: MColors.secondary,
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  offset: Offset(1, 1))
            ]),
        padding: const EdgeInsets.all(8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "3",
                  style: context.textTheme.headlineLarge,
                ),
              ),
              Image.network(
                "https://picsum.photos/300/300",
                // "https://cdn.iconscout.com/icon/free/png-256/avatar-380-456332.png",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Nome Cognome"),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Punti 25",
                  style: context.textTheme.labelSmall,
                ),
              ),
            ]));
  }
}
