import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  ScaffoldMessengerState get scaffold => ScaffoldMessenger.of(this);
  NavigatorState get navigator => Navigator.of(this);
  ModalRoute<Object?>? get modalRoute => ModalRoute.of(this);
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
}
