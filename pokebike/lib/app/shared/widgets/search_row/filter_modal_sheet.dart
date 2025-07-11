import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/search_options.dart';
import 'package:moto_hunters/app/shared/controllers/filter_sheet_controller.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/mbutton.dart';
import 'package:moto_hunters/app/shared/widgets/search_row/filter_modal_box.dart';
import 'package:moto_hunters/generated/l10n.dart';

class FilterModalSheet extends GetView<FilterSheetController> {
  final Function(SearchOptions) onSave;
  const FilterModalSheet({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: Get.context!.height * 0.7,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 3,
                child: ListView(
                    children: controller.controllers.values
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: FilterModalBox(
                                controller: e,
                              ),
                            ))
                        .toList())),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: MButton(
                  label: S.of(context).apply, onTap: () => _applicaClicked(context)),
            ),
            MButton(
              label: S.of(context).cancel,
              onTap: () => Get.context!.navigator.pop(),
              color: Colors.white,
              textColor: MColors.primary,
            ),
          ],
        ));
  }

  void _applicaClicked(BuildContext context) {
    final SearchOptions options = controller.getOptions();
    print(options);
    onSave(options);
    // controller.reset();
    Get.context!.navigator.pop();
  }
}
