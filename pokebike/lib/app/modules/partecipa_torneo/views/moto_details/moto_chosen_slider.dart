import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/widgets/default_dialog.dart';
import 'package:moto_hunters/generated/l10n.dart';

class MotoChosenButton extends GetView<PartecipaTorneoController> {
  final int motoId;

  const MotoChosenButton({super.key, required this.motoId});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: MButton.red(
        onPressed: () => _showDialog(context),
        padding: const EdgeInsets.all(8),
        child: Text(S.of(context).chooseYou),
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     _showDialog(context);
    //   },
    //   onVerticalDragUpdate: (details) {
    //     if (details.primaryDelta! > 0) {
    //       _showDialog(context);
    //     }
    //   },
    //   child: Container(
    //     width: Get.context!.width * 0.13,
    //     height: Get.context!.height * 0.2,
    //     decoration: const BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(32),
    //         topRight: Radius.circular(32),
    //       ),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.white,
    //           spreadRadius: 1,
    //           blurRadius: 5,
    //           offset: Offset(0, 3),
    //         ),
    //       ],
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         const Icon(
    //           Icons.keyboard_arrow_up_outlined,
    //           color: Colors.black,
    //           size: 28,
    //         ),
    //         Icon(
    //           Icons.keyboard_arrow_up_outlined,
    //           color: Colors.black.withValues(alpha: 0.5),
    //           size: 28,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  void _showDialog(BuildContext context) {
    Dialog alert = Dialog(
      backgroundColor: MColors.grey,
      child: DefaultDialog(
          title: S.of(context).motoForRaceTitle,
          message: S.of(context).motoForRaceMessage,
          redTitle: S.of(context).choose,
          redAction: _dialogOkTap,
          whiteTitle: S.of(context).nullify,
          whiteAction: (BuildContext context) => Get.context!.navigator.pop()),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _dialogOkTap(BuildContext context) async {
    ApiResponse response = await controller.chooseMoto(motoId);
    if (Get.context!.mounted) {
      handleApiResponse(context, response,
          successMessage: S.of(context).selectedMoto,
          errorMessage: S.of(context).selectedMotoError);
      Get.context!.navigator.pop();
    }
  }
}
