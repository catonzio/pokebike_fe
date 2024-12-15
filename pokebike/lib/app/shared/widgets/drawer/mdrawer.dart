import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_item.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_item_widget.dart';
import 'package:pokebike/app/shared/widgets/default_dialog.dart';
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
      padding: const EdgeInsets.only(left: 16.0, bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: context.height * 0.1, bottom: context.height * 0.03),
            child: ShimmerTitle.light(
              text: 'helloBiker'.tr,
            ),
          ),
          ...drawerItems.map((e) => Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: DrawerItemWidget(
                  item: e,
                  onTap: () => _onTap(context, e.path, e.arguments),
                ),
              )),
          const Spacer(),
          DrawerItemWidget(
              onTap: () => _tapLogout(context), item: drawerItemLogout),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, String path, dynamic arguments) {
    final MDrawerController controller = Get.find<MDrawerController>();
    context.pushNamed(path, arguments: arguments);
    controller.toggleDrawer();
  }

  void _tapLogout(BuildContext context) {
    Dialog alert = Dialog(
      backgroundColor: MColors.grey,
      child: DefaultDialog(
          title: 'logoutTitle'.tr,
          message: 'logoutMessage'.tr,
          redTitle: 'exit'.tr,
          redAction: _dialogEsciTap,
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

  _dialogEsciTap(BuildContext context) {
    final MDrawerController controller = Get.find<MDrawerController>();
    controller.logout();
    context.navigator
        .pushNamedAndRemoveUntil(Routes.LOGIN_REGISTER, (_) => false);
  }
}
