import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  set obscurePassword(bool value) => _obscurePassword.value = value;
  void toggleObscurePassword() => _obscurePassword.value = !obscurePassword;
}
