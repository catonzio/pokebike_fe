import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/mdrawer.dart';
import 'package:pokebike/app/shared/widgets/micon.dart';

class DefaultPage extends GetView<MDrawerController> {
  final Widget body;

  const DefaultPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final Widget page = Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        leading: MIcon(
          name: "Menu icon",
          size: 16,
          onTap: controller.toggleDrawer,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: MIcon(
              name: "Community icon white",
              onTap: () => _tapCommunity(context),
            ),
          ),
          MIcon(
            name: "Notification icon white",
            onTap: () => {},
          )
        ],
      ),
      body: body,
      bottomNavigationBar: const BottomNavbar(),
    );

    return Scaffold(
      body: Stack(
        children: [
          const Mdrawer(),
          Obx(() => InkWell(
                onTap: controller.isDrawerOpen ? controller.toggleDrawer : null,
                child: page,
              )
                  .animate(target: controller.isDrawerOpen ? 1.0 : 0)
                  .move(
                      begin: Offset.zero,
                      end: Offset(context.width * 0.6, 0),
                      curve: Curves.easeInOutCubic)
                  .scaleY(begin: 1, end: 0.8, curve: Curves.easeInOutCubic)),
        ],
      ),
    );
  }

  void _tapCommunity(BuildContext context) {
    context.navigator.pushNamed(Routes.COMMUNITY);
  }
}
