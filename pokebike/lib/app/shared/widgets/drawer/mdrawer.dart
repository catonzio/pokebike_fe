import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_item.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_item_widget.dart';
import 'package:pokebike/app/shared/widgets/drawer/logout_dialog.dart';
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
    Dialog alert = const Dialog(
      backgroundColor: MColors.grey,
      child: LogoutDialog(),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
