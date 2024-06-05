import 'package:get/get.dart';

class GarageController extends GetxController {
  final RxBool isShowingGarage = true.obs;

  final RxBool _isFetchingGarage = false.obs;
  bool get isFetchingGarage => _isFetchingGarage.value;
  set isFetchingGarage(bool value) => _isFetchingGarage.value = value;

  final RxBool _isFetchingCollection = false.obs;
  bool get isFetchingCollection => _isFetchingCollection.value;
  set isFetchingCollection(bool value) => _isFetchingCollection.value = value;

  final List<int> fakeGarages = List.generate(3, (index) => index);
  final RxList<int> garages = <int>[].obs;

  final List<int> fakeCollections = List.generate(3, (index) => index);
  final RxList<int> collections = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    ever(isShowingGarage, toggleShowing);
    _fetchGarage();
    // _fetchCollection();
  }

  void _fetchGarage() async {
    isFetchingGarage = true;
    await Future.delayed(const Duration(seconds: 3));
    // garages.addAll(List.generate(10, (index) => index + 1));
    isFetchingGarage = false;
  }

  void _fetchCollection() async {
    isFetchingCollection = true;
    await Future.delayed(const Duration(seconds: 3));
    collections.addAll(List.generate(10, (index) => index + 1));
    isFetchingCollection = false;
  }

  void toggleShowing(bool value) {
    isShowingGarage.value = value;
    if (!value && collections.isEmpty) {
      _fetchCollection();
    } else if (value && garages.isEmpty) {
      _fetchGarage();
    }
  }
}
