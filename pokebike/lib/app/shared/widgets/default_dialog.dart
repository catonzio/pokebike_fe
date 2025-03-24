import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/shared/mbutton.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final String message;
  final String redTitle;
  final Function(BuildContext) redAction;
  final String whiteTitle;
  final Function(BuildContext) whiteAction;

  const DefaultDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.redTitle,
      required this.redAction,
      required this.whiteTitle,
      required this.whiteAction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      width: context.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
            MButton(label: redTitle, onTap: () => redAction(context)),
            MButton(
                label: whiteTitle,
                color: Colors.white,
                onTap: () => whiteAction(context),
                textColor: MColors.primary,
                border: Border.all(color: MColors.secondaryDark, width: 2)),
          ],
        ),
      ),
    );
  }
}
