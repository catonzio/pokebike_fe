import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';

class MswitcherController extends GetxController {
  final RxBool value = false.obs;
}

class MSwitcher extends StatelessWidget {
  final Function(bool)? onChanged;

  const MSwitcher({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final MswitcherController controller = Get.put(MswitcherController());
    return Obx(() => Switch(
          value: controller.value.value,
          onChanged: (bool value) {
            controller.value.value = value;
            onChanged?.call(value);
          },
          // thumbColor: WidgetStatePropertyAll(Colors.white),
          // trackColor: WidgetStatePropertyAll(Colors.green),
          activeColor: Colors.white,
          activeTrackColor: Colors.green,
          // inactiveThumbColor: MColors.primaryDark,
          inactiveTrackColor: MColors.primary,
        ));
  }
}
