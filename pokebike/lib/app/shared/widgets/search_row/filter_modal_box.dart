import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/controllers/filter_box_controller.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mcheckbox.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mradio_button.dart';

class FilterModalBox extends StatelessWidget {
  final FilterBoxController controller;

  const FilterModalBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Obx(() => Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: DefaultTextStyle(
              style: context.textTheme.bodyLarge!.copyWith(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => controller.toggle(),
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(controller.title),
                          Icon(controller.isExpanded.value
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up)
                          // Obx(() => Icon(controller.isExpanded.value
                          //     ? Icons.keyboard_arrow_down
                          //     : Icons.keyboard_arrow_up))
                        ],
                      ),
                    ),
                  ),
                  // controller.isExpanded.value
                  //     ? OptionsWidget(controller: controller, options: options)
                  //     : const SizedBox()
                  Obx(() => controller.isExpanded.value
                      ? OptionsWidget(
                          controller: controller, options: controller.options)
                      : const SizedBox()),
                ],
              ),
            ),
          ).animate(target: controller.isExpanded.value ? 1 : 0));
    });
  }
}

class OptionsWidget extends StatelessWidget {
  final FilterBoxController controller;
  final List<String> options;

  const OptionsWidget({
    super.key,
    required this.controller,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: controller.options.indexed
          .map(((int, String) option) => GestureDetector(
                onTap: () => controller.toggleCheckbox(option.$2),
                behavior: HitTestBehavior.opaque,
                child: ListTile(
                  leading: Obx(() => options.length > 3
                      ? MCheckbox(
                          isChecked: controller.isSelected(option.$2),
                          onChanged: (b) =>
                              controller.toggleCheckbox(option.$2))
                      : MRadioButton<String>(
                          // groupValue: options.first,
                          isSelected: controller.isSelected(option.$2).value,
                          value: option.$2,
                          onChanged: (String value) =>
                              controller.toggleCheckbox(option.$2))),
                  title: Text(option.$2),
                ),
              ))
          .toList(),
    );
  }
}
