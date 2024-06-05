import 'package:flutter/material.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/search_row/filter_modal_sheet.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_text_field.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          flex: 8,
          child: SearchTextField(),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => _showFilterDialog(context),
            customBorder: const CircleBorder(),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              padding: const EdgeInsets.all(6),
              child: const MIcon(
                name: "Filter icon",
              ),
            ),
          ),
        ),
      ],
    );
  }

  _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        enableDrag: true,
        showDragHandle: true,
        useSafeArea: true,
        isScrollControlled: true, // change this to make it fullscreen
        backgroundColor: MColors.primary,
        builder: (context) => const Wrap(
              children: [
                FilterModalSheet(),
              ],
            ));
  }
}
