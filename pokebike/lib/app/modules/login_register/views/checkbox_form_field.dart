import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mcheckbox.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {super.key,
      super.onSaved,
      super.validator,
      required RxBool value,
      required Function(bool?) onChanged,
      bool super.initialValue = false,
      Widget? title,
      bool autovalidate = false})
      : super(builder: (FormFieldState<bool> state) {
          return ListTile(
            dense: state.hasError,
            title: title,
            leading: MCheckbox(
                isChecked: value,
                onChanged: (bool? newValue) {
                  state.didChange(newValue);
                  onChanged(newValue);
                }),
            subtitle: state.hasError
                ? Builder(
                    builder: (BuildContext context) => Text(
                      state.errorText ?? "",
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  )
                : null,
          );
          // return CheckboxListTile(
          //   dense: state.hasError,
          //   title: title,
          //   value: state.value,
          //   onChanged: state.didChange,
          //   activeColor: MColors.secondary,
          //   checkColor: Colors.transparent,
          //   // activeColor: const WidgetStatePropertyAll(MColors.secondary),
          //   fillColor: const WidgetStatePropertyAll(MColors.secondary),
          //   // selectedTileColor: MColors.secondary,
          //   subtitle: state.hasError
          //       ? Builder(
          //           builder: (BuildContext context) => Text(
          //             state.errorText ?? "",
          //             style:
          //                 TextStyle(color: Theme.of(context).colorScheme.error),
          //           ),
          //         )
          //       : null,
          //   controlAffinity: ListTileControlAffinity.leading,
          // );
        });
}
