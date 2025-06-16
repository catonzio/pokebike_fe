import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/widgets/mcircular_avatar.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/modules/settings/views/settings_editing_password_form.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';

import '../controllers/settings_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class SettingsEditPasswordWidget extends GetView<SettingsController> {
  const SettingsEditPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height - Constants.bottomNavbarHeight,
      padding: const EdgeInsets.all(16.0),
      child: Obx(() => Stack(
            children: [
              Positioned.fill(
                bottom: Get.context!.keyboardHeight == 0
                    ? Constants.bottomNavbarHeight / 4
                    : Get.context!.keyboardHeight / 1.3,
                child: _mainBody(context)
                    .animate(target: controller.saving ? 1 : 0)
                    .blur(
                      curve: Curves.easeInCubic,
                      duration: const Duration(milliseconds: 500),
                    ),
              ),
              if (controller.saving) const MCircularProgressIndicator()
            ],
          )),
    );
  }

  Widget _mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.context!.height - Constants.bottomNavbarHeight * 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: MCircularAvatar(
                avatar: controller.user.value?.avatar ?? ApiMedia.empty(),
                radius: 45,
              ),
            ),
            const Expanded(flex: 3, child: SettingsEditingPasswordForm()),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MButton.red(
                      onPressed: () => _salva(context),
                      child: Text(S.of(context).save)),
                  MButton.white(
                      onPressed: () => controller.editingPassword = false,
                      child: Text(S.of(context).nullify,
                          style: Get.context!.textTheme.bodySmall!
                              .copyWith(color: MColors.primaryDark))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _salva(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      ApiResponse response = await controller.salvaPassword();
      if (Get.context!.mounted) {
        handleApiResponse(
          context,
          response,
          successMessage: response.message,
          errorMessage: response.message,
          onSuccess: (p0) => controller.editingPassword = false,
        );
      }
    }
    // controller.salva().then((ApiResponse response) {
    //   handleApiResponse(context, response,
    //       successMessage: "Salvataggio completato", onSuccess: (_) {
    //     controller.editing = false;
    //     controller.user.value = User.fromJson(response.data);
    //   });
    // });
  }
}
