import 'package:flutter/material.dart';
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
        leading: const MIcon(
          name: "Menu icon",
        ),
        actions: const [
          MIcon(name: "Community icon white"),
          MIcon(name: "Notification icon white")
        ],
      ),
      body: body,
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
