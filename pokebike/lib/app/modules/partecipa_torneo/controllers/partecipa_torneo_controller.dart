import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';

class PartecipaTorneoController extends GetxController {
  final RxBool isFetching = false.obs;

  final List<Moto> fakeCollections =
      List.generate(6, (index) => Moto.fake(index));
  final RxList<Moto> collections = <Moto>[].obs;

  final RxBool isMotoChosen = false.obs;
  final RxInt motoIndex = 0.obs;
  set index(int value) => motoIndex.value = value;

  @override
  void onInit() {
    super.onInit();
    fetchCollection();
  }

  Future<void> fetchCollection() async {
    isFetching.value = true;
    await Future.delayed(const Duration(seconds: 3));
    collections.addAll(List.generate(100, (index) => Moto.fake(index)));
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

  void chooseMoto(int index) {
    isMotoChosen.value = true;
    motoIndex.value = index;
    print("Moto scelta con successo! Index: $index");
  }

  void reset() {
    isMotoChosen.value = false;
    motoIndex.value = 0;
  }
}
