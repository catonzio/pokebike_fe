import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/ads/app_banner_ad.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/back_button.dart';
import 'package:moto_hunters/app/shared/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:moto_hunters/app/shared/widgets/drawer/drawer_controller.dart';
import 'package:moto_hunters/app/shared/widgets/drawer/mdrawer.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

class DefaultPage extends GetView<MDrawerController> {
  final Widget body;
  final AppBar? appBar;
  final List<Widget>? actions;
  final bool useAppbar;
  final bool backButton;
  final bool bottomBar;
  final String? title;
  final TextStyle? titleStyle;
  final Color backgroundColor;
  final List<Widget>? bottomAppbarActions;
  final Widget? fab;
  final Future<void>? Function()? fabOnTap;
  final bool showBanner;

  const DefaultPage(
      {super.key,
      required this.body,
      this.appBar,
      this.actions,
      this.useAppbar = true,
      this.backButton = false,
      this.bottomBar = true,
      this.title,
      this.titleStyle,
      this.backgroundColor = Colors.black,
      this.bottomAppbarActions,
      this.fab,
      this.fabOnTap,
      this.showBanner = true});

  @override
  Widget build(BuildContext context) {
    final Widget page = Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor,
      appBar: useAppbar ? (appBar ?? _createAppbar(context)) : null,
      body: Column(
        children: [
          showBanner
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppBannerAd(),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: (backButton && !useAppbar)
                ? Stack(
                    children: [
                      body,
                      // Positioned(
                      //   child: _createBackButton(context),
                      // ),
                    ],
                  )
                : body,
          )
        ],
      ),
      bottomNavigationBar: bottomBar ? const BottomNavbar() : null,
      resizeToAvoidBottomInset: false,
    );

    return GetX(builder: (MDrawerController controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const Mdrawer(),
            const DrawerBackgroundRedContainer(),
            InkWell(
              onTap: controller.isDrawerOpen ? controller.toggleDrawer : null,
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
                    end: Offset(Get.context!.width * 0.6, 0),
                    curve: Curves.easeInOutCubic)
                .scale(
                    duration: const Duration(milliseconds: 300),
                    begin: const Offset(1, 1),
                    end: const Offset(0.8, 0.8),
                    curve: Curves.easeInOutCubic),
          ],
        ),
        floatingActionButton: _buildFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      );
    });
  }

  AnimatedSwitcher _buildFAB() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child, // Don't forget to pass the child here
          ),
        );
      },
      child: fabOnTap != null
          ? Padding(
              padding: const EdgeInsets.only(
                  bottom: Constants.bottomNavbarHeight / 2, right: 5),
              child: fab ??
                  FloatingActionButton(
                    elevation: 10,
                    onPressed: fabOnTap,
                    shape: const CircleBorder(),
                    backgroundColor: MColors.iconRed,
                    child: const Icon(
                      Icons.arrow_circle_up,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
            )
          : const SizedBox.shrink(),
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
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: MIcon(
                name:
                    "Notification icon ${Get.currentRoute == Routes.NOTIFICATIONS ? "red" : "white"}",
                onTap: () => _tapNotifications(context),
              ),
            )
          ],
      bottom: PreferredSize(
          preferredSize: Size(
              0,
              backButton && (title?.isNotEmpty ?? false)
                  ? Get.context!.width * 0
                  : 0),
          child: backButton ? _createBackButton(context) : const SizedBox()),
      toolbarHeight: Get.context!.height * (backButton ? 0.14 : 0.08),
    );
  }

  Widget _createBackButton(BuildContext context) {
    // final Widget bottomAppbar = Align(
    //   alignment: Alignment.topLeft,
    //   child: MBackButton(
    //     onPressed: () => Get.context!.navigator.pop(),
    //   ),
    // );
    final Widget bottomAppbar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MBackButton(onPressed: Get.context!.navigator.pop),
          Row(
            children: bottomAppbarActions ?? [],
          )
        ],
      ),
    );
    if (backButton && title == null) {
      return bottomAppbar;
    } else {
      return Stack(
        children: [
          bottomAppbar,
          Center(
              child: SizedBox(
                  width: Get.context!.width * 0.6,
                  // height: Get.context!.height * 0.1,
                  child: titleStyle == null
                      ? ShimmerTitle.light(
                          text: title!,
                          textAlign: TextAlign.center,
                        )
                      : ShimmerTitle.light(
                          text: title!,
                          style: titleStyle!,
                          textAlign: TextAlign.center,
                        )))
        ],
      );
    }
  }

  void _tapCommunity(BuildContext context) {
    Get.context!.pushNamed(Routes.COMMUNITY);
  }

  _tapNotifications(BuildContext context) {
    Get.context!.pushNamed(Routes.NOTIFICATIONS);
  }
}

class DrawerBackgroundRedContainer extends StatelessWidget {
  const DrawerBackgroundRedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.context!.height * 0.15,
      left: Get.context!.width * 0.54,
      width: Get.context!.width * 0.3,
      height: Get.context!.height * 0.7,
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
