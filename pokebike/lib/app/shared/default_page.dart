import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/mdrawer.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class DefaultPage extends GetView<MDrawerController> {
  final Widget body;
  final List<Widget>? actions;

  const DefaultPage({super.key, required this.body, this.actions});

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
        actions: actions ??
            [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: MIcon(
                  name:
                      "Community icon ${Get.currentRoute == Routes.COMMUNITY ? "red" : "white"}",
                  onTap: () => _tapCommunity(context),
                ),
              ),
              MIcon(
                name:
                    "Notification icon ${Get.currentRoute == Routes.NOTIFICATIONS ? "red" : "white"}",
                onTap: () => _tapNotifications(context),
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
          Positioned(
            top: context.height * 0.15,
            left: context.width * 0.54,
            width: context.width * 0.3,
            height: context.height * 0.7,
            child: Container(
              decoration: const BoxDecoration(
                color: MColors.secondaryUltraDark,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
          Obx(() => InkWell(
                onTap: controller.isDrawerOpen ? controller.toggleDrawer : null,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(controller.isDrawerOpen ? 16 : 0),
                  child: page,
                ),
              )
                  .animate(target: controller.isDrawerOpen ? 1.0 : 0)
                  .move(
                      begin: Offset.zero,
                      end: Offset(context.width * 0.6, 0),
                      curve: Curves.easeInOutCubic)
                  .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(0.8, 0.8),
                      curve: Curves.easeInOutCubic)),
        ],
      ),
    );
  }

  void _tapCommunity(BuildContext context) {
    context.navigator.pushNamed(Routes.COMMUNITY);
  }

  _tapNotifications(BuildContext context) {
    context.navigator.pushNamed(Routes.NOTIFICATIONS);
  }
}
