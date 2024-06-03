import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/mbutton.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

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
              "Sei sicuro di voler uscire?",
              style: context.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "Una volta uscito dovrai effettuare nuovamente l'accesso per utilizzare l'app",
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
            MButton(label: "Annulla", onTap: () => context.navigator.pop()),
            MButton(
                label: "Esci",
                color: Colors.white,
                onTap: () => _dialogEsciTap(context),
                textColor: MColors.primary,
                border: Border.all(color: MColors.secondaryDark, width: 2)),
          ],
        ),
      ),
    );
  }

  _dialogEsciTap(BuildContext context) {
    final MDrawerController controller = Get.find<MDrawerController>();
    controller.toggleDrawer();
    context.navigator.pushNamed(Routes.LOGIN);
  }
}
