import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/profile/profile_arguments.dart';
import 'package:pokebike/app/modules/profile/providers/profile_provider.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_item.dart';

class ProfileController extends GetxController {
  ProfileArguments? argumentUser = Get.arguments as ProfileArguments?;

  final RxInt selectedIndex = 1.obs;
  final RxBool isOwnProfile = false.obs;

  final RxBool isLoadingNumCatture = false.obs;
  final RxBool isLoadingCoccarde = false.obs;
  final RxBool isLoadingClassifica = false.obs;
  final RxBool isFetchingUser = false.obs;
  final RxBool isFetchingProfile = false.obs;
  final RxBool isFetchingPartecipazione = false.obs;
  final RxBool isFetchingTopMotos = false.obs;

  final RxList<String> fakeMedaglie = <String>["ciao", "a", "tutti"].obs;

  final Map<String, int> fakeCoccardeScore = <String, int>{
    for (var el in List.generate(20, (index) => '')) el: 0
  };
  final RxMap<String, int> coccardeScore = <String, int>{}.obs;

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
    fetchCoccarde();
  }

  Future<void> setUser(ProfileArguments? arguments) async {
    // se gli arguments sono vuoti
    if (arguments == null ||
        (arguments.user == null && arguments.profileId == null)) {
      isOwnProfile.value = true;
      isFetchingUser.value = true;
      user.value = await provider.fetchUserMe();
      isFetchingUser.value = false;
      setUserProfile();

      // se negli arguments c'e lo user
    } else if (arguments.user != null && user.value == null) {
      user.value = arguments.user;
      setUserProfile();

      // se negli arguments c'e il profileId
    } else if (arguments.user == null && arguments.profileId != null) {
      user.value = await provider.fetchUserWithProfile(arguments.profileId!);
    } else {
      throw Exception("Wrong arguments for ProfileController");
    }
    // if (user.value?.profile == null) {
    //   isFetchingProfile.value = true;
    //   user.value = user.value!.copyWith(
    //       profile: await provider.fetchProfile(user.value!.profileId));
    //   isFetchingProfile.value = false;
    // }
  }

  Future<void> setUserProfile() async {
    isFetchingProfile.value = true;
    user.value = user.value!
        .copyWith(profile: await provider.fetchProfile(user.value!.profileId));
    isFetchingProfile.value = false;
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
    lastPartecipazione.value =
        await provider.fetchLastPartecipazione(user.value!.profileId);
    isFetchingPartecipazione.value = false;
  }

  Future<void> fetchCoccarde() async {
    isLoadingCoccarde.value = true;
    final Map<String, int> coccarde =
        await provider.fetchCockades(user.value!.profileId);
    coccardeScore.value = coccarde;
    isLoadingCoccarde.value = false;
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
