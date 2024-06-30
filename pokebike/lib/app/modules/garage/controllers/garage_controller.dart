import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';

class GarageController extends GetxController {
  final RxBool isShowingGarage = true.obs;

  final RxBool _isFetchingGarage = false.obs;
  bool get isFetchingGarage => _isFetchingGarage.value;
  set isFetchingGarage(bool value) => _isFetchingGarage.value = value;

  final RxBool _isFetchingCollection = false.obs;
  bool get isFetchingCollection => _isFetchingCollection.value;
  set isFetchingCollection(bool value) => _isFetchingCollection.value = value;

  final List<Moto> fakeGarages = List.generate(3, (index) => Moto.fake(index));
  final RxList<Moto> garages = <Moto>[].obs;

  final List<Moto> fakeCollections = List.generate(3, (index) => Moto.fake(index));
  final RxList<Moto> collections = <Moto>[].obs;

  @override
  void onInit() {
    super.onInit();
    ever(isShowingGarage, toggleShowing);
    fetchGarage();
    fetchCollection();
  }

  void fetchGarage() async {
    isFetchingGarage = true;
    await Future.delayed(const Duration(seconds: 3));
    // garages.addAll(List.generate(10, (index) => index + 1));
    isFetchingGarage = false;
  }

  Future<void> fetchCollection() async {
    isFetchingCollection = true;
    await Future.delayed(const Duration(seconds: 3));
    collections.addAll(List.generate(10, (index) => Moto.fake(index)));
    isFetchingCollection = false;
  }

  void toggleShowing(bool value) {
    isShowingGarage.value = value;
    if (!value && collections.isEmpty) {
      fetchCollection();
    } else if (value && garages.isEmpty) {
      fetchGarage();
    }
  }
}
