import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/back_button.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:pokebike/app/shared/widgets/drawer/drawer_controller.dart';
import 'package:pokebike/app/shared/widgets/drawer/mdrawer.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';
import 'package:pokebike/app/shared/widgets/utils/micon.dart';

class DefaultPage extends GetView<MDrawerController> {
  final Widget body;
  final AppBar? appBar;
  final List<Widget>? actions;
  final bool useAppbar;
  final bool backButton;
  final bool bottomBar;
  final String? title;

  const DefaultPage(
      {super.key,
      required this.body,
      this.appBar,
      this.actions,
      this.useAppbar = true,
      this.backButton = false,
      this.bottomBar = true,
      this.title});

  @override
  Widget build(BuildContext context) {
    final Widget page = Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: useAppbar ? (appBar ?? _createAppbar(context)) : null,
      body: (backButton && !useAppbar)
          ? Stack(
              children: [
                body,
                Positioned(
                  child: _createBackButton(context),
                ),
              ],
            )
          : body,
      bottomNavigationBar: bottomBar ? const BottomNavbar() : null,
      resizeToAvoidBottomInset: false,
    );

    return SafeArea(
      child: GetX(builder: (MDrawerController controller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                const Mdrawer(),
                const DrawerBackgroundRedContainer(),
                InkWell(
                  onTap:
                      controller.isDrawerOpen ? controller.toggleDrawer : null,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(controller.isDrawerOpen ? 16 : 0),
                    child: page,
                  ),
                )
                    .animate(target: controller.isDrawerOpen ? 1.0 : 0)
                    .move(
                        duration: const Duration(milliseconds: 300),
                        begin: Offset.zero,
                        end: Offset(context.width * 0.6, 0),
                        curve: Curves.easeInOutCubic)
                    .scale(
                        duration: const Duration(milliseconds: 300),
                        begin: const Offset(1, 1),
                        end: const Offset(0.8, 0.8),
                        curve: Curves.easeInOutCubic),
              ],
            ),
          ),
        );
      }),
    );
  }

  AppBar _createAppbar(BuildContext context) {
    return AppBar(
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
      bottom: PreferredSize(
          preferredSize: const Size(0, 0),
          child: backButton ? _createBackButton(context) : const SizedBox()),
      toolbarHeight: context.height * (backButton ? 0.14 : 0.08),
    );
  }

  Widget _createBackButton(BuildContext context) {
    if (backButton && title == null) {
      return Align(
        alignment: Alignment.topLeft,
        child: MBackButton(
          onPressed: () => context.navigator.pop(),
        ),
      );
    } else {
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: MBackButton(
              onPressed: () => context.navigator.pop(),
            ),
          ),
          Center(
              child: SizedBox(
                  width: context.width * 0.4,
                  child: ShimmerTitle.light(
                    text: title!,
                    textAlign: TextAlign.center,
                  )))
        ],
      );
    }
  }

  void _tapCommunity(BuildContext context) {
    context.navigator.pushNamed(Routes.COMMUNITY);
  }

  _tapNotifications(BuildContext context) {
    context.navigator.pushNamed(Routes.NOTIFICATIONS);
  }
}

class DrawerBackgroundRedContainer extends StatelessWidget {
  const DrawerBackgroundRedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
