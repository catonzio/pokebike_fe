import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/generated/l10n.dart';

extension ContextUtils on BuildContext {
  ScaffoldMessengerState get scaffold => ScaffoldMessenger.of(this);
  NavigatorState get navigator => Navigator.of(this);
  ModalRoute<Object?>? get modalRoute => ModalRoute.of(this);
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  void createSnackbar(String text, {SnackBarAction? action}) {
    scaffold.showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 30,
      action: action ??
          SnackBarAction(
            label: S.of(Get.context!).ok,
            onPressed: () => scaffold.clearSnackBars(),
          ),
    ));
  }

  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) {
    bool routeExists = false;

    navigator.popUntil((route) {
      if (route.settings.name == routeName) {
        routeExists = true;
      }
      return true; // Continue traversing the stack
    });

    if (routeExists) {
      navigator.popUntil((route) => route.settings.name == routeName);
      navigator.pop();
    }

    return navigator.pushNamed(routeName, arguments: arguments);
  }
}
