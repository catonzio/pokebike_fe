import 'package:get/get.dart';
import 'package:pokebike/app/data/enums/garage_type.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/profile/providers/profile_provider.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

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
  RxList<Moto> filteredGarages = <Moto>[].obs;

  final List<Moto> fakeCollections =
      List.generate(3, (index) => Moto.fake(index));
  final RxList<Moto?> collections = <Moto?>[].obs;

  final Rxn<User> user = Rxn<User>();
  final MotoProvider provider;

  GarageController({required this.provider});

  @override
  void onInit() {
    super.onInit();
    isShowingGarage.value = Get.arguments == GarageType.garage;
    fetchUser();
    // ever(isShowingGarage, toggleShowing);
    fetchGarage();
    fetchCollection();
  }

  Future<void> fetchUser() async {
    user.value = await Get.find<ProfileProvider>().fetchUserMe();
  }

  Future<void> fetchGarage() async {
    isFetchingGarage = true;
    // await Future.delayed(const Duration(seconds: 3));
    garages.clear();
    final List<Moto> fetchedGarages = await provider.fetchMotos();
    garages.addAll(fetchedGarages);
    // garages.addAll(List.generate(10, (index) => index + 1));
    filteredGarages.value = garages;
    isFetchingGarage = false;
  }

  Future<void> fetchCollection() async {
    isFetchingCollection = true;
    await Future.delayed(const Duration(seconds: 1));
    collections.addAll(List.generate(
        100, (index) => ((index) % 3 == 0) ? Moto.fake(index) : null));
    isFetchingCollection = false;
  }

  Future<void> refreshList() async {
    if (isShowingGarage.value) {
      await fetchGarage();
    } else {
      await fetchCollection();
    }
  }

  void toggleShowing(bool value) {
    isShowingGarage.value = value;
    if (!value && collections.isEmpty) {
      fetchCollection();
    } else if (value && garages.isEmpty) {
      fetchGarage();
    }
  }

  void filterGarages(String value) {
    if (value.isEmpty) {
      filteredGarages.value = garages;
    } else {
      filteredGarages.value = garages
          .where(
              (moto) => moto.nome.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }
}
