import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/giant_title.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Il vincitore è:"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            width: context.width * 0.9,
            height: context.width * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: Image.network(MImageProvider.getImageUrl()).image,
                    fit: BoxFit.cover)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: GiantTitle(title: "Nome Cognome"),
        )
      ],
    );
  }
}

