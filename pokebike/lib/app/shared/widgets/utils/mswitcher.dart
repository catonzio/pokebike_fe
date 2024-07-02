import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class MswitcherController extends GetxController {
  final RxBool value = false.obs;

  MswitcherController(bool value) {
    this.value.value = value;
  }
}

class MSwitcher extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const MSwitcher({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    // final MswitcherController controller = Get.put(MswitcherController(value));
    return GetX(
      // initState: (state) {
      //   state.controller ??= Get.put(MswitcherController(value));
      // },
      init: Get.put(MswitcherController(value)),
      builder: (MswitcherController controller) {
        print("Switcher: ${controller.value.value}");
        return Switch(
          value: controller.value.value,
          onChanged: (bool value) async {
            if (onChanged != null) {
              controller.value.value = await onChanged?.call(value);
            } else {
              controller.value.value = value;
            }
          },
          // thumbColor: WidgetStatePropertyAll(Colors.white),
          // trackColor: WidgetStatePropertyAll(Colors.green),
          activeColor: Colors.white,
          activeTrackColor: Colors.green,
          // inactiveThumbColor: MColors.primaryDark,
          inactiveTrackColor: MColors.primary,
        );
      },
    );
    // return Obx(() => Switch(
    //       value: controller.value.value,
    //       onChanged: (bool value) {
    //         controller.value.value = value;
    //         onChanged?.call(value);
    //       },
    //       // thumbColor: WidgetStatePropertyAll(Colors.white),
    //       // trackColor: WidgetStatePropertyAll(Colors.green),
    //       activeColor: Colors.white,
    //       activeTrackColor: Colors.green,
    //       // inactiveThumbColor: MColors.primaryDark,
    //       inactiveTrackColor: MColors.primary,
    //     ));
  }
}