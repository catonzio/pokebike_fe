import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';

class ClassificaProfileRow extends StatelessWidget {
  final Partecipazione partecipazione;
  const ClassificaProfileRow({super.key, required this.partecipazione});

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
                  partecipazione.id.toString(),
                  style: context.textTheme.headlineLarge,
                ),
              ),
              Image.network(partecipazione.avatar),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(partecipazione.fullName),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Punti ${partecipazione.punti}",
                  style: context.textTheme.labelSmall,
                ),
              ),
            ]));
  }
}
