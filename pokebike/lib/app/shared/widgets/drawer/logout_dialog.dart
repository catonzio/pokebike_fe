import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final String message;
  final String actionTitle;
  final Function action;
  const DefaultDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.actionTitle,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      width: context.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
            MButton(label: "Annulla", onTap: () => context.navigator.pop()),
            MButton(
                label: "Esci",
                color: Colors.white,
                onTap: () => action(context),
                textColor: MColors.primary,
                border: Border.all(color: MColors.secondaryDark, width: 2)),
          ],
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
        title: "Sei sicuro di voler uscire?",
        message:
            "Una volta uscito dovrai effettuare nuovamente l'accesso per utilizzare l'app",
        actionTitle: "Esci",
        action: _dialogEsciTap);
  }

  _dialogEsciTap(BuildContext context) {
    final MDrawerController controller = Get.find<MDrawerController>();
    controller.toggleDrawer();
    context.navigator.pushNamed(Routes.LOGIN);
  }
}

class EliminaAccountDialog extends StatelessWidget {
  const EliminaAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
        title: "Sei sicuro di voler eliminare il tuo account?",
        message: "Una volta confermato non potrai più accedere al tuo profilo",
        actionTitle: "Esci",
        action: _dialogEliminaTap);
  }

  _dialogEliminaTap(BuildContext context) {
    context.navigator.pushNamed(Routes.SPLASH);
  }
}
