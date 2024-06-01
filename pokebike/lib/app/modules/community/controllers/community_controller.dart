import 'package:get/get.dart';

class CommunityController extends GetxController {
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final List<int> fakeCommunities = List.generate(5, (index) => index);
  final RxList<int> communities = <int>[].obs;

  @override
  void onInit() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      communities.addAll(List.generate(10, (index) => index));
    });
    super.onInit();
  }
}
