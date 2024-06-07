import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_button.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_controller.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_item.dart';

class PaginationRow extends GetView<PaginationController> {
  final List<PaginationItem> items;

  const PaginationRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final double height = context.height * 0.04;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items
            .map((item) => Obx(
                  () => Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: item.leftPadding, right: item.rightPadding),
                      child: PaginationButton(
                        text: item.text,
                        height: height,
                        isSelected: controller.currentPage == item.index,
                        onPressed: () {
                          controller.setCurrentPage(item.index);
                          item.onPressed();
                        },
                      ),
                    ),
                  ),
                ))
            .toList(),
        // [
        //   Obx(() => Expanded(
        //         flex: 2,
        //         child: Padding(
        //           padding: const EdgeInsets.only(right: 8),
        //           child: PaginationButton(
        //             text: "Garage",
        //             height: height,
        //             isSelected: controller.isShowingGarage.value,
        //             onPressed: () => controller.toggleShowing(true),
        //           ),
        //         ),
        //       )),
        //   Obx(() => Expanded(
        //         flex: 2,
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 8),
        //           child: PaginationButton(
        //             text: "Collezione",
        //             height: height,
        //             isSelected: !(controller.isShowingGarage.value),
        //             onPressed: () => controller.toggleShowing(false),
        //           ),
        //         ),
        //       ))
        // ],
      ),
    );
  }
}
