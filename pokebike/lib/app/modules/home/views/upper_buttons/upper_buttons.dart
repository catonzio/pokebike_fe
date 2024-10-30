import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/enums/garage_type.dart';
import 'package:pokebike/app/modules/home/views/upper_buttons/upper_button.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class UpperButtons extends StatelessWidget {
  const UpperButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.width * 0.05,
      runSpacing: context.height * 0.03,
      children: [
        UpperButton(
          icon: "Garage icon white",
          onTap: () => context.navigator
              .pushNamed(Routes.GARAGE, arguments: GarageType.garage),
          text: 'myGarage'.tr,
        ),
        UpperButton(
          icon: "Collection icon white",
          onTap: () => context.navigator
              .pushNamed(Routes.GARAGE, arguments: GarageType.collection),
          text: 'collection'.tr,
        ),
        UpperButton(
          icon: "Profile icon white",
          onTap: () => context.navigator.pushNamed(Routes.PROFILE),
          text: 'profile'.tr,
        )
      ],
    );
  }
}
