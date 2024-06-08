import 'package:get/get.dart';

class PartecipaTorneoController extends GetxController {
  final RxBool isFetching = false.obs;

  final List<int> fakeCollections = List.generate(6, (index) => index);
  final RxList<int> collections = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCollection();
  }

  Future<void> fetchCollection() async {
    isFetching.value = true;
    await Future.delayed(const Duration(seconds: 3));
    collections.addAll(List.generate(100, (index) => index + 1));
    isFetching.value = false;
  }

  void onTapElement(int index) {
    print("Tapped $index");
  }

  Future<void> onRefresh() async {
    collections.clear();
    await fetchCollection();
  }

  void onSearch(String query) {
    collections.clear();
    fetchCollection();
  }
}
