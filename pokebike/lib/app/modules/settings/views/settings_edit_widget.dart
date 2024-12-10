import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/shared/widgets/mcircular_avatar.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/modules/settings/views/settings_editing_form.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';
import 'package:pokebike/app/shared/widgets/default_dialog.dart';
import 'package:pokebike/app/shared/widgets/paginator_widget.dart';

import '../controllers/settings_controller.dart';

class SettingsEditWidget extends GetView<SettingsController> {
  const SettingsEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height - Constants.bottomNavbarHeight,
      padding: const EdgeInsets.all(16.0),
      child: Obx(() => Stack(
            children: [
              Positioned.fill(
                bottom: context.keyboardHeight == 0
                    ? Constants.bottomNavbarHeight / 4
                    : context.keyboardHeight / 1.3,
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
        height: context.height - Constants.bottomNavbarHeight * 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Obx(() => MCircularAvatar(
                    imagePath: controller.user.value?.avatar,
                    file: controller.newAvatar.value,
                    radius: 45,
                    onModify: (file) => controller.newAvatar.value = file,
                  )),
            ),
            const Expanded(flex: 3, child: SettingsEditingForm()),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MButton.red(
                      onPressed: () => _salva(context), child: Text('save'.tr)),
                  MButton.white(
                      onPressed: () => controller.editing = false,
                      child: Text('nullify'.tr,
                          style: context.textTheme.bodySmall!
                              .copyWith(color: MColors.primaryDark))),
                  InkWell(
                    onTap: () => deleteAccount(context),
                    child: Text('deleteAccount'.tr),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  deleteAccount(BuildContext context) {
    Dialog alert = Dialog(
      backgroundColor: MColors.grey,
      child: DefaultDialog(
          title: 'deleteAccountTitle'.tr,
          message: 'deleteAccountMessage'.tr,
          redTitle: 'delete'.tr,
          redAction: _dialogEliminaTap,
          whiteTitle: 'nullify'.tr,
          whiteAction: (BuildContext context) => context.navigator.pop()),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _dialogEliminaTap(BuildContext context) {
    controller.deleteUser().then((ApiResponse value) => !context.mounted
        ? null
        : handleApiResponse(context, value,
            onSuccess: (_) => context.navigator
                .pushNamedAndRemoveUntil(Routes.SPLASH, (_) => false)));
  }

  _salva(BuildContext context) async {
    controller.salva().then((ApiResponse response) {
      !context.mounted
          ? null
          : handleApiResponse(context, response,
              successMessage: 'savingCompleted'.tr, onSuccess: (_) {
              controller.editing = false;
              controller.user.value = User.fromJson(response.data);
            });
    });
  }
}
