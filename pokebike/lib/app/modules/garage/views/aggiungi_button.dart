import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class AggiungiButton extends StatelessWidget {
  final Function() onTap;
  const AggiungiButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      decoration: BoxDecoration(
        color: MColors.secondary,
        borderRadius: BorderRadius.circular(32),
      ),
      alignment: Alignment.center,
      child: Text(
        "Aggiungi",
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
