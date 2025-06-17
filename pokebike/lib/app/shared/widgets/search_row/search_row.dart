import 'package:flutter/material.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/search_options.dart';
import 'package:moto_hunters/app/shared/widgets/search_row/filter_modal_sheet.dart';
import 'package:moto_hunters/app/shared/widgets/search_row/search_text_field.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';
import 'package:get/get.dart';

class SearchRow extends StatelessWidget {
  final Function(String) onSearchField;
  final Function(SearchOptions) onSave;
  final bool showButton;
  final FocusNode? focusNode;

  const SearchRow(
      {super.key,
      required this.onSearchField,
      required this.onSave,
      this.showButton = true,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: SearchTextField(onSearch: onSearchField, focusNode: focusNode),
        ),
        if (showButton)
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
    focusNode?.unfocus();
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        enableDrag: true,
        showDragHandle: true,
        useSafeArea: true,
        isScrollControlled: true, // change this to make it fullscreen
        backgroundColor: MColors.primary,
        builder: (context) => Wrap(children: [
              FilterModalSheet(
                onSave: onSave,
              )
            ]));
  }
}
