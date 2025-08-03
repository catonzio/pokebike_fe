import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/shared/widgets/mcircular_avatar.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/modules/settings/views/settings_editing_form.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/widgets/default_dialog.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';

import '../controllers/settings_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class SettingsEditWidget extends GetView<SettingsController> {
  const SettingsEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height - Constants.bottomNavbarHeight * 1.5,
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () => Stack(
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
        ),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    return SizedBox(
      height: Get.context!.height - (Constants.bottomNavbarHeight * 1.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Obx(() => MCircularAvatar(
                  avatar: controller.user.value?.avatar ?? ApiMedia.empty(),
                  file: controller.newAvatar.value,
                  radius: 45,
                  onModify: (file) => controller.newAvatar.value = file,
                )),
          ),
          const Expanded(flex: 6, child: SettingsEditingForm()),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MButton.red(
                    onPressed: () => _salva(context),
                    child: Text(S.of(context).save)),
                MButton.white(
                    onPressed: () => controller.editing = false,
                    child: Text(S.of(context).nullify,
                        style: Get.context!.textTheme.bodySmall!
                            .copyWith(color: MColors.primaryDark))),
                InkWell(
                  onTap: () => deleteAccount(context),
                  child: Text(S.of(context).deleteAccount),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  deleteAccount(BuildContext context) {
    Dialog alert = Dialog(
      backgroundColor: MColors.grey,
      child: DefaultDialog(
          title: S.of(context).deleteAccountTitle,
          message: S.of(context).deleteAccountMessage,
          redTitle: S.of(context).delete,
          redAction: _dialogEliminaTap,
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

  _dialogEliminaTap(BuildContext context) {
    controller.deleteUser().then((ApiResponse value) => !Get.context!.mounted
        ? null
        : handleApiResponse(context, value,
            onSuccess: (_) => Get.context!.navigator
                .pushNamedAndRemoveUntil(Routes.SPLASH, (_) => false)));
  }

  _salva(BuildContext context) async {
    controller.salva().then((ApiResponse response) {
      !Get.context!.mounted
          ? null
          : handleApiResponse(context, response,
              successMessage: S.of(context).savingCompleted, onSuccess: (_) {
              controller.editing = false;
              controller.user.value = User.fromJson(response.data);
              // Reset newAvatar per mostrare l'avatar aggiornato dal server
              controller.newAvatar.value = null;
            });
    });
  }
}
