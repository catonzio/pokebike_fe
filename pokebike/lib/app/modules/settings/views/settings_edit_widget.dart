import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/modules/home/views/stories/story_widget.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/modules/settings/views/settings_editing_form.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';
import 'package:pokebike/app/shared/widgets/default_dialog.dart';

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
              if (controller.saving)
                const Center(
                  child: CircularProgressIndicator(),
                )
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
              child: StoryWidget(
                imagePath: MImageProvider.getImageUrl(),
                radius: 45,
              ),
            ),
            const Expanded(flex: 3, child: SettingsEditingForm()),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MButton.red(
                      onPressed: () => _salva(context),
                      child: const Text("Salva")),
                  MButton.white(
                      onPressed: () => controller.editing = false,
                      child: Text("Annulla",
                          style: context.textTheme.bodySmall!
                              .copyWith(color: MColors.primaryDark))),
                  InkWell(
                    onTap: () => deleteAccount(context),
                    child: const Text("Elimina account"),
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
          title: "Sei sicuro di voler eliminare il tuo account?",
          message:
              "Una volta confermato non potrai più accedere al tuo profilo",
          redTitle: "Annulla",
          redAction: (BuildContext context) => context.navigator.pop(),
          whiteTitle: "Elimina",
          whiteAction: _dialogEliminaTap),
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
    context.navigator.pushNamed(Routes.SPLASH);
  }

  _salva(BuildContext context) async {
    final bool result = await controller.salva();
    if (context.mounted) {
      context.scaffold.showSnackBar(SnackBar(
        content: Text(result
            ? "Salvataggio completato"
            : "Salvataggio non riuscito. Errore"),
        action: SnackBarAction(
            label: "Ok", onPressed: () => context.scaffold.clearSnackBars()),
      ));
    }
    if (result) controller.editing = false;
  }
}
