import 'package:flutter/material.dart';
import 'package:moto_hunters/generated/l10n.dart';

/// Widget per mostrare dialog informativi con "Non mostrare più"
Future<void> showInfoDialog(
  BuildContext context,
  String message, {
  VoidCallback? onNeverShowAgain,
}) {
  bool dontShowAgain = false;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).info),
        content: SingleChildScrollView(child: Text(message)),
        actions: [
          if (onNeverShowAgain != null)
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  children: [
                    Checkbox(
                      value: dontShowAgain,
                      onChanged: (val) => setState(() => dontShowAgain = val!),
                    ),
                    Expanded(child: Text(S.of(context).dontShowAgain)),
                  ],
                );
              },
            ),
          TextButton(
            onPressed: () {
              if (dontShowAgain && onNeverShowAgain != null) {
                onNeverShowAgain();
              }
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).ok),
          ),
        ],
      );
    },
  );
}
