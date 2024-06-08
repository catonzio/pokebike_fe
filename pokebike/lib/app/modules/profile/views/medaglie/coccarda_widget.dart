import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class CoccardaWidget extends StatelessWidget {
  final String text;
  final double value;
  const CoccardaWidget(this.text, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            children: [
              Positioned.fill(
                  child: CircularProgressIndicator(
                value: value.toDouble(),
              )),
              Center(
                child: MIcon(
                  name: "Cockade icon argento",
                  size: 30,
                ),
              )
            ],
          ),
        ),
        AutoSizeText(
          text,
          maxLines: 1,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
