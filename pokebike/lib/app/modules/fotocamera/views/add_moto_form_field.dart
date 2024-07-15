import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokebike/app/config/themes.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form_field_model.dart';
import 'package:pokebike/app/shared/utils/input_decoration.dart';

class AddMotoFormField extends StatelessWidget {
  final MotoFormFieldModel model;

  const AddMotoFormField({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    FormField field;

    if (model is MotoFormFieldModelDropdown) {
      List<DropdownMenuItem> items = (model as MotoFormFieldModelDropdown)
          .items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList();
      field = DropdownButtonFormField(
        items: items,
        value: model.controller.text.isEmpty ? null : model.controller.text,
        validator: (dynamic value) => model.validator!(value as String?),
        onChanged: (dynamic value) {
          model.controller.text = value.toString();
        },
        decoration: transparentInputDecoration(model.label),
      );
    } else {
      field = TextFormField(
        controller: model.controller,
        minLines: 1,
        maxLines: model.maxLines,
        inputFormatters: model.isNumeric
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ]
            : null,
        keyboardType: model.isNumeric ? TextInputType.number : null,
        style: Themes.lightFormTextStyle,
        validator: model.validator,
        decoration: transparentInputDecoration(model.label),
        onTap: model.onTap,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(model.label),
        ),
        field
      ],
    );
  }
}
