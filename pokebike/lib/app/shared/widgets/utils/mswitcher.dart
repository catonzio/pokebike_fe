import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';

class MSwitcher extends StatefulWidget {
  final bool value;
  final Function(bool)? onChanged;
  const MSwitcher({super.key, required this.value, this.onChanged});

  @override
  State<MSwitcher> createState() => _MSwitcherState();
}

class _MSwitcherState extends State<MSwitcher> {
  late bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (bool value) async {
        bool newValue;
        if (widget.onChanged != null) {
          newValue = await widget.onChanged!(value);
        } else {
          newValue = value;
        }
        setState(() {
          value = newValue;
        });
      },
      // thumbColor: WidgetStatePropertyAll(Colors.white),
      // trackColor: WidgetStatePropertyAll(Colors.green),
      activeColor: Colors.white,
      activeTrackColor: Colors.green,
      // inactiveThumbColor: MColors.primaryDark,
      inactiveTrackColor: MColors.primary,
    );
  }
}

class MswitcherController extends GetxController {
  final RxBool value = false.obs;

  MswitcherController(bool value) {
    print(
        "Setting inside controller. Value: $value This.value: ${this.value.value}");
    this.value.value = value;
  }
}

class MSwitcherOld extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const MSwitcherOld({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (bool value) async {
        if (onChanged != null) {
          value = await onChanged!(value);
        } else {
          value = value;
        }
      },
      // thumbColor: WidgetStatePropertyAll(Colors.white),
      // trackColor: WidgetStatePropertyAll(Colors.green),
      activeColor: Colors.white,
      activeTrackColor: Colors.green,
      // inactiveThumbColor: MColors.primaryDark,
      inactiveTrackColor: MColors.primary,
    );
    // final MswitcherController controller = Get.put(MswitcherController(value));
    // return GetX<MswitcherController>(
    //   // initState: (state) {
    //   //   state.controller ??= Get.put(MswitcherController(value));
    //   // },
    //   init: Get.put(MswitcherController(value)),
    //   initState: (state) {
    //     WidgetsBinding.instance.addPostFrameCallback((_) async {
    //       print("Setting inside initState: $value");
    //       state.controller?.value.value = value;
    //     });
    //   },
    //   builder: (MswitcherController controller) {
    //     print("Switcher: ${controller.value.value}");
    //     return Switch(
    //       value: controller.value.value,
    //       onChanged: (bool value) async {
    //         if (onChanged != null) {
    //           controller.value.value = await onChanged!(value);
    //         } else {
    //           controller.value.value = value;
    //         }
    //       },
    //       // thumbColor: WidgetStatePropertyAll(Colors.white),
    //       // trackColor: WidgetStatePropertyAll(Colors.green),
    //       activeColor: Colors.white,
    //       activeTrackColor: Colors.green,
    //       // inactiveThumbColor: MColors.primaryDark,
    //       inactiveTrackColor: MColors.primary,
    //     );
    //   },
    // );
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
