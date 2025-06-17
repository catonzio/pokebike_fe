import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DividerTitle extends StatelessWidget {
  final String text;
  const DividerTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Expanded(
          child: Divider(
            color: Colors.white,
            height: 15,
          ),
        ),
        SizedBox(
            width: width * 0.25,
            child: Align(alignment: Alignment.center, child: Text(text))),
        const Expanded(
          child: Divider(
            color: Colors.white,
            height: 15,
          ),
        )
      ],
    );
  }
}
