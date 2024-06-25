import 'package:flutter/material.dart';

class AddMotoFormFieldModel {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function()? onTap;
  final bool isNumeric;
  final int maxLines;

  AddMotoFormFieldModel(
      {required this.label,
      required this.controller,
      this.validator,
      this.onTap,
      this.isNumeric = false,
      this.maxLines = 1});
}

class AddMotoFormFieldModelDropdown extends AddMotoFormFieldModel {
  final List<String> items;

  AddMotoFormFieldModelDropdown({
    required super.label,
    required super.validator,
    required super.controller,
    required this.items,
    super.onTap,
  });
}
