import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/home/views/upper_buttons/upper_button.dart';

class UpperButtons extends StatelessWidget {
  const UpperButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.width * 0.05,
      runSpacing: context.height * 0.03,
      children: [
        UpperButton(
          icon: "Garage icon white",
          onTap: () => print("Garage"),
          text: "Il mio garage",
        ),
        UpperButton(
          icon: "Collection icon white",
          onTap: () => print("Collezione"),
          text: "Collezione",
        ),
        UpperButton(
          icon: "Profile icon white",
          onTap: () => print("Profilo"),
          text: "Profilo",
        )
      ],
    );
  }
}
