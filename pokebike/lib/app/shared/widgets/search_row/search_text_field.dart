import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onSearch;
  final FocusNode? focusNode;
  const SearchTextField({super.key, required this.onSearch, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: 'search'.tr,
        hintStyle:
            context.textTheme.bodyLarge!.copyWith(color: MColors.primary),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const MIcon(
          name: "Search icon",
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: Colors.white),
        ),
        contentPadding: const EdgeInsets.only(left: 64, right: 16),
      ),
      style: context.textTheme.bodyLarge!.copyWith(color: MColors.primary),
      cursorColor: MColors.primary,
      maxLines: 1,
      minLines: 1,
      onChanged: onSearch,
    );
  }
}
