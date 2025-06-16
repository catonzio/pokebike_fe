import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/enums/garage_type.dart';
import 'package:moto_hunters/app/modules/home/views/upper_buttons/upper_button.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/generated/l10n.dart';

class UpperButtons extends StatelessWidget {
  const UpperButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Get.context!.width * 0.05,
      runSpacing: Get.context!.height * 0.03,
      children: [
        UpperButton(
          icon: "Garage icon white",
          onTap: () => Get.context!
              .pushNamed(Routes.GARAGE, arguments: GarageType.garage),
          text: S.of(context).myGarage,
        ),
        UpperButton(
          icon: "Collection icon white",
          onTap: () => Get.context!
              .pushNamed(Routes.GARAGE, arguments: GarageType.collection),
          text: S.of(context).collection,
        ),
        UpperButton(
          icon: "Profile icon white",
          onTap: () => Get.context!.pushNamed(Routes.PROFILE),
          text: S.of(context).profile,
        )
      ],
    );
  }
}
