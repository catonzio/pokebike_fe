import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';

class MDrawerController extends GetxController {
  static MDrawerController get to => Get.find();
  
  final RxBool _isDrawerOpen = false.obs;
  bool get isDrawerOpen => _isDrawerOpen.value;
  set isDrawerOpen(bool value) => _isDrawerOpen.value = value;

  final RxBool _isPerformingLogout = false.obs;
  bool get isPerformingLogout => _isPerformingLogout.value;
  set isPerformingLogout(bool value) => _isPerformingLogout.value = value;

  final AuthProvider logoutProvider;

  MDrawerController({required this.logoutProvider});

  void toggleDrawer() {
    if (isPerformingLogout) return;
    isDrawerOpen = !isDrawerOpen;
  }

  Future<ApiResponse> logout() async {
    isPerformingLogout = true;
    ApiResponse response = await logoutProvider.logout();
    Storage.to.apiToken = "";
    isPerformingLogout = false;
    return response;
  }
}