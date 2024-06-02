import 'package:get/get.dart';

class MDrawerController extends GetxController {
  final RxBool _isDrawerOpen = false.obs;
  bool get isDrawerOpen => _isDrawerOpen.value;
  set isDrawerOpen(bool value) => _isDrawerOpen.value = value;

  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
  }
}