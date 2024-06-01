import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/widgets/micon.dart';

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
          child: SearchWidget(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            padding: const EdgeInsets.all(6),
            child: const MIcon(
              name: "Filter icon",
            ),
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Cerca",
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
    );
  }
}
