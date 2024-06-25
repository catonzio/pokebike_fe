import 'package:flutter/material.dart';

class RegisterFormFieldModel {
  final String label;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool isPassword;
  final Function()? onTap;

  RegisterFormFieldModel({
    required this.label,
    required this.validator,
    required this.controller,
    required this.isPassword,
    this.onTap,
  });
}
