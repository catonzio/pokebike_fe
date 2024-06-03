import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/mbutton.dart';
import 'package:pokebike/app/shared/widgets/search_row/filter_modal_box.dart';

class FilterModalSheet extends StatelessWidget {
  const FilterModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.maxFinite,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const FilterModalBox(
                title: "Ordina per",
                options: ["Più recenti", "Dalla A alla Z"]),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MButton(label: "Applica", onTap: () => {}),
            ),
            MButton(
              label: "Cancella",
              onTap: () => {},
              color: Colors.white,
              textColor: MColors.primary,
            )
          ],
        ));
  }
}
