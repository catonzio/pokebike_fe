import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/config/themes.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/utils/decoration_image.dart';
import 'package:moto_hunters/app/shared/utils/input_decoration.dart';
import 'package:moto_hunters/app/shared/widgets/base_app_bar.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';
import 'package:moto_hunters/app/shared/widgets/utils/loading_stack.dart';

import '../controllers/confirm_register_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class ConfirmRegisterView extends GetView<ConfirmRegisterController> {
  const ConfirmRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(onBackPressed: () => Get.context!.navigator.pop()),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image:
                  getDarkDecorationImage('assets/images/register_bg.png', 0.3)),
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingStack(
                  isLoading: controller.isPerformingRegisterCheck,
                  child: _mainBody(context))),
        ));
  }

  Widget _mainBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerTitle.dark(
              text: S.of(context).confirm,
              // style: TextStyle(
              //     fontSize: 34,
              //     fontWeight: FontWeight.bold,
              //     color: MColors.primaryDark),
            ),
            ShimmerTitle.dark(
              text: S.of(context).register,
              // style: TextStyle(
              //     fontSize: 34,
              //     fontWeight: FontWeight.bold,
              //     color: MColors.primaryDark),
            ),
          ],
        ),
        SizedBox(
          height: Get.context!.height * 0.15,
          child: Form(key: controller.formKey, child: _formBody(context)),
        ),
        MButton(
          onPressed: () => _confirm(context),
          backgroundColor: MColors.secondaryDark,
          child: Text(S.of(context).registerYou),
        )
      ],
    );
  }

  Widget _formBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(S.of(context).codeViaEmail),
        TextFormField(
            controller: controller.codeController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            minLines: 1,
            maxLines: 1,
            style: Themes.darkFormTextStyle,
            validator: controller.codeValidator,
            decoration: lightInputDecoration(S.of(context).insertCode)),
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: () => _askAnotherCode(context),
            child: Text(S.of(context).anotherCode,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }

  void _confirm(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      ApiResponse result = await controller.confirmRegister();
      if (Get.context!.mounted) {
        handleApiResponse(context, result, onSuccess: (value) {
          Get.context!.navigator.pushReplacementNamed(Routes.HOME);
        });
        // if (result) {
        //   Get.context!.navigator.pushReplacementNamed(Routes.HOME);
        // } else {
        //   Get.context!.scaffold.showSnackBar(SnackBar(
        //     content: const Text("Errore in fase di registrazione"),
        //     action: SnackBarAction(
        //       label: "Ok",
        //       onPressed: () => Get.context!.scaffold.clearSnackBars,
        //     ),
        //   ));
        // }
      }
    }
  }

  _askAnotherCode(BuildContext context) {
    controller.askCode().then((ApiResponse value) => Get.context!.mounted
        ? handleApiResponse(context, value, successMessage: S.of(context).codeSent)
        : null);
  }
}
