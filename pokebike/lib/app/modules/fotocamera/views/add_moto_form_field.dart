import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moto_hunters/app/config/themes.dart';
import 'package:moto_hunters/app/modules/fotocamera/views/add_moto_form_field_model.dart';
import 'package:moto_hunters/app/shared/utils/input_decoration.dart';

class AddMotoFormField extends StatelessWidget {
  final MotoFormFieldModel model;

  const AddMotoFormField({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    Widget field;

    if (model is MotoFormFieldModelDropdown) {
      MotoFormFieldModelDropdown mmodel = model as MotoFormFieldModelDropdown;
      List<DropdownMenuItem> items = mmodel.items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList();
      field = DropdownButtonFormField(
        key: ValueKey(mmodel.items),
        items: items,
        value: mmodel.controller.text.isNotEmpty &&
                mmodel.items.contains(mmodel.controller.text.trim())
            ? mmodel.controller.text
            : null,
        validator: (dynamic value) => mmodel.validator?.call(value as String?),
        onChanged: (dynamic value) {
          mmodel.controller.text = value.toString();
        },
        decoration: transparentInputDecoration(mmodel.label),
      );
    } else {
      field = TextFormField(
        controller: model.controller,
        minLines: 1,
        maxLines: model.maxLines,
        readOnly: model.readOnly,
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
