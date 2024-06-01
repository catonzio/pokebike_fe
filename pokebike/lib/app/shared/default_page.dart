import 'package:flutter/material.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:pokebike/app/shared/widgets/micon.dart';

class DefaultPage extends StatelessWidget {
  final Widget body;

  const DefaultPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        leading: const MIcon(name: "Menu icon", size: 16),
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
  }

  void _tapCommunity(BuildContext context) {
    context.navigator.pushNamed(Routes.COMMUNITY);
  }
}
