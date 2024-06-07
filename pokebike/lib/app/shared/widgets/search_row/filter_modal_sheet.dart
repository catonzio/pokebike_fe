import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/shared/controllers/filter_sheet_controller.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';
import 'package:pokebike/app/shared/widgets/search_row/filter_modal_box.dart';

class FilterModalSheet extends StatelessWidget {
  const FilterModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: context.height * 0.7,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 3,
                child: ListView(
                  children: [
                    for (var key in Constants.filterBoxes.keys)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: FilterModalBox(
                            title: key, options: Constants.filterBoxes[key]!),
                      ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: MButton(
                  label: "Applica", onTap: () => _applicaClicked(context)),
            ),
            MButton(
              label: "Cancella",
              onTap: () => context.navigator.pop(),
              color: Colors.white,
              textColor: MColors.primary,
            ),
          ],
        ));
  }

  void _applicaClicked(BuildContext context) {
    final FilterSheetController controller = Get.find<FilterSheetController>();
    final Map<String, List<String>> options = controller.getOptions();
    print(options);
    controller.reset();
    context.navigator.pop();
  }
}
