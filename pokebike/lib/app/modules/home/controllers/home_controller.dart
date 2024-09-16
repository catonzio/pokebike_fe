import 'package:get/get.dart';
import 'package:pokebike/app/shared/providers/auth_provider.dart';
import 'package:pokebike/firebase.dart';

class HomeController extends GetxController {
  final RxBool _isLoadingStories = false.obs;
  bool get isLoadingStories => _isLoadingStories.value;
  set isLoadingStories(bool value) => _isLoadingStories.value = value;

  // final RxBool _isLoadingCommunity = false.obs;
  // bool get isLoadingCommunity => _isLoadingCommunity.value;
  // set isLoadingCommunity(bool value) => _isLoadingCommunity.value = value;

  final List<String> fakeStories = List.generate(5, (index) => "Story $index");
  final RxList<String> stories = <String>[].obs;

  // final List<String> fakeCommunities =
  //     List.generate(10, (index) => "Community $index");
  // final RxList<String> communities = <String>[].obs;

  @override
  void onReady() {
    super.onReady();
    _loadStories();
    _initializeDeviceToken();
  }

  void _loadStories() async {
    isLoadingStories = true;
    await Future.delayed(const Duration(seconds: 2));
    stories.addAll(List.generate(10, (index) => "Story $index"));
    isLoadingStories = false;
  }

  Future<void> _initializeDeviceToken() async {
    String? token = await FirebaseInitializer.initialize();
    if (token != null) {
      Get.find<AuthProvider>().setDeviceToken(token);
    }
  }

  // void _loadCommunity() async {
  //   isLoadingCommunity = true;
  //   await Future.delayed(const Duration(seconds: 3));
  //   communities.addAll(List.generate(10, (index) => "Community $index"));
  //   isLoadingCommunity = false;
  // }
}
