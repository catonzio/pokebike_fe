import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_item.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_item_widget.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

class Mdrawer extends StatelessWidget {
  const Mdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage("assets/images/drawer_bg.png"),
              fit: BoxFit.cover)),
      padding: const EdgeInsets.only(left: 16.0, bottom: 128),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.height * 0.1, bottom: 32.0),
            child: const ShimmerTitle(
              text: "Ciao Biker!",
              colors: [Colors.white, Colors.grey, Colors.white],
            ),
          ),
          ...drawerItems.map((e) => Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: DrawerItemWidget(
                  item: e,
                  onTap: () => _onTap(context, e.path),
                ),
              )),
          const Spacer(),
          DrawerItemWidget(
              onTap: () => _tapLogout(context), item: drawerItemLogout),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, String path) {
    final MDrawerController controller = Get.find<MDrawerController>();
    controller.toggleDrawer();
    context.navigator.pushNamed(path);
  }

  void _tapLogout(BuildContext context) {
    Dialog alert = Dialog(
      backgroundColor: MColors.grey,
      child: SizedBox(
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
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _dialogEsciTap(BuildContext context) {
    final MDrawerController controller = Get.find<MDrawerController>();
    controller.toggleDrawer();
    context.navigator.pushNamed(Routes.LOGIN);
  }

}

class MButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color? textColor;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final Function() onTap;

  const MButton(
      {super.key,
      required this.label,
      this.color = MColors.secondaryDark,
      this.textColor,
      this.border,
      this.width = double.infinity,
      this.height,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = context.textTheme.bodyMedium!;
    if (textColor != null) {
      textStyle = textStyle.copyWith(color: textColor);
    }

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(32),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            border: border,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
