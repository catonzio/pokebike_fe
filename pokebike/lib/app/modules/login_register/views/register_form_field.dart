import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/themes.dart';
import 'package:moto_hunters/app/modules/login_register/register_form_field.dart';
import 'package:moto_hunters/app/shared/utils/input_decoration.dart';

class RegisterFormField extends StatelessWidget {
  final RegisterFormFieldModel model;
  final Function()? toggleObscurePassword;
  final RxBool? obscurePassword;

  const RegisterFormField({
    super.key,
    required this.model,
    this.toggleObscurePassword,
    this.obscurePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(model.label),
        ),
        model.isPassword
            ? Obx(() => TextFormField(
                controller: model.controller,
                obscureText: obscurePassword?.value ?? false,
                minLines: 1,
                maxLines: 1,
                style: Themes.darkFormTextStyle,
                validator: model.validator,
                decoration: lightInputDecoration(model.label,
                    isPassword: model.isPassword,
                    toggleObscurePassword: toggleObscurePassword)))
            : TextFormField(
                controller: model.controller,
                minLines: 1,
                maxLines: 1,
                style: Themes.darkFormTextStyle,
                validator: model.validator,
                decoration: lightInputDecoration(model.label),
                onTap: model.onTap,
              )
      ],
    );
  }
}
