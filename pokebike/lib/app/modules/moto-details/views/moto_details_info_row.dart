import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MotoDetailsInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const MotoDetailsInfoRow(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 4, child: Text(label, style: context.textTheme.bodyLarge)),
          Expanded(
              flex: 6,
              child: Text(
                value,
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.left,
              ))
        ],
      ),
    );
  }
}
