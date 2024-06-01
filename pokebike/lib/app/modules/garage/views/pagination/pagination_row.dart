
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_controller.dart';
import 'package:pokebike/app/modules/garage/views/pagination/pagination_button.dart';

class PaginationRow extends GetView<GarageController> {
  const PaginationRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = context.height * 0.04;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: PaginationButton(
                    text: "Garage",
                    height: height,
                    isSelected: controller.isShowingGarage.value,
                    onPressed: () => controller.toggleShowing(true),
                  ),
                ),
              )),
          Obx(() => Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: PaginationButton(
                    text: "Collezione",
                    height: height,
                    isSelected: !(controller.isShowingGarage.value),
                    onPressed: () => controller.toggleShowing(false),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

