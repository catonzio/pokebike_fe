import 'package:flutter/material.dart';

class MotoFormFieldModel {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function()? onTap;
  final bool isNumeric;
  final int maxLines;
  final bool readOnly;

  MotoFormFieldModel(
      {required this.label,
      required this.controller,
      this.validator,
      this.onTap,
      this.isNumeric = false,
      this.maxLines = 1,
      this.readOnly = false});
}

class MotoFormFieldModelDropdown extends MotoFormFieldModel {
  final List<String> items;

  MotoFormFieldModelDropdown({
    required super.label,
    required super.validator,
    required super.controller,
    required this.items,
    super.onTap,
  });
}
