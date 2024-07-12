import 'dart:math';

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/profile/providers/profile_provider.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_item.dart';

class ProfileController extends GetxController {
  User? argumentUser = Get.arguments as User?;

  final RxInt selectedIndex = 1.obs;
  final RxBool isOwnProfile = false.obs;

  final RxBool isLoadingMedaglie = false.obs;
  final RxBool isLoadingCoccarde = false.obs;
  final RxBool isLoadingClassifica = false.obs;
  final RxBool isFetchingUser = false.obs;
  final RxBool isFetchingProfile = false.obs;
  final RxBool isFetchingPartecipazione = false.obs;
  final RxBool isFetchingTopMotos = false.obs;

  final RxList<String> fakeMedaglie = <String>["ciao", "a", "tutti"].obs;
  final RxList<String> medaglie = <String>[].obs;
  final Map<String, double> fakeCoccardeScore = <String, double>{
    for (var el in Constants.filterBoxes["Tipo"]!) el: 0.0
  };
  final Map<String, double> coccardeScore = <String, double>{}.obs;

  final ProfileProvider provider;
  final Rxn<Partecipazione> lastPartecipazione = Rxn<Partecipazione>();
  final Rxn<User> user = Rxn<User>();
  // final Rxn<Torneo> torneo = Rxn<Torneo>();

  final List<Moto> fakeMotos = List.generate(3, (index) => Moto.fake(3));
  final RxList<Moto> topMotos = <Moto>[].obs;

  int get numPartecipazioni =>
      (user.value?.profile?.numVittorie ?? 0) +
      (user.value?.profile?.numSconfitte ?? 0);

  ProfileController({required this.provider});

  @override
  onInit() async {
    super.onInit();
    await setUser(argumentUser);
    fetchLastPartecipazione();
    fetchTopMotos();
    fetchMedaglie();
    fetchCoccarde();
  }

  Future<void> setUser(User? user) async {
    if (user == null) {
      isOwnProfile.value = true;
      isFetchingUser.value = true;
      this.user.value = await provider.fetchUserMe();
      isFetchingUser.value = false;
    }
    if (this.user.value == null) {
      this.user.value = user;
    }
    if (this.user.value?.profile == null) {
      isFetchingProfile.value = true;
      this.user.value = this.user.value!.copyWith(
          profile: await provider.fetchProfile(this.user.value!.profileId));
      isFetchingProfile.value = false;
    }
  }

  Future<void> fetchTopMotos() async {
    isFetchingTopMotos.value = true;
    List<Moto> motos = await provider.fetchTopMotos(user.value!.id);
    isFetchingTopMotos.value = false;
    topMotos.clear();
    topMotos.addAll(motos);
  }

  Future<void> fetchLastPartecipazione() async {
    isFetchingPartecipazione.value = true;
    lastPartecipazione.value = await provider.fetchLastPartecipazione(user.value!.profileId);
    isFetchingPartecipazione.value = false;
  }
  // void setTorneo(Torneo torneo) {
  //   isLoadingClassifica.value = true;
  //   Future.delayed(const Duration(seconds: 2), () {
  //     isLoadingClassifica.value = false;
  //     if (this.torneo.value == null) {
  //       this.torneo.value = torneo;
  //     }
  //   });
  // }

  void fetchMedaglie() {
    isLoadingMedaglie.value = true;
    Future.delayed(const Duration(seconds: 7), () {
      isLoadingMedaglie.value = false;
      if (medaglie.isEmpty) {
        medaglie.addAll(fakeMedaglie);
      }
    });
  }

  void fetchCoccarde() {
    isLoadingCoccarde.value = true;
    Random random = Random();
    Future.delayed(const Duration(seconds: 5), () {
      isLoadingCoccarde.value = false;
      if (coccardeScore.isEmpty) {
        coccardeScore.addAll({
          for (var el in Constants.filterBoxes["Tipo"]!)
            el: random.nextInt(100) / 100
        });
      }
    });
  }

  // bool get isGarage => selectedIndex.value == 0;
  bool get isMedaglie => selectedIndex.value == 0;
  bool get isClassifica => selectedIndex.value == 1;

  List<PaginationItem> get items => [
        // PaginationItem(
        //     text: "Garage",
        //     index: 0,
        //     leftPadding: 0.0,
        //     rightPadding: 8.0,
        //     onPressed: () => changeIndex(0)),
        PaginationItem(
            text: "Medaglie",
            index: 0,
            leftPadding: 8.0,
            rightPadding: 8.0,
            onPressed: () => changeIndex(0)),
        PaginationItem(
            text: "Classifica",
            index: 1,
            leftPadding: 8.0,
            rightPadding: 0.0,
            onPressed: () => changeIndex(1)),
      ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  
}
