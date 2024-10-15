import 'package:get/get.dart';
import 'package:pokebike/app/data/models/classifica_tile/classifica_tile.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
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
  final RxBool isFetchingClassificaTile = false.obs;
  final RxBool isFetchingTopMotos = false.obs;

  final RxList<String> fakeMedaglie = <String>["ciao", "a", "tutti"].obs;

  final Map<String, int> fakeCoccardeScore = <String, int>{
    for (var el in List.generate(20, (index) => '$index')) el: int.parse(el)
  };
  final RxMap<String, int> coccardeScore = <String, int>{}.obs;

  final ProfileProvider provider;
  final Rxn<ClassificaTile> classificaTile = Rxn<ClassificaTile>();
  final Rxn<User> user = Rxn<User>();
  // final Rxn<Torneo> torneo = Rxn<Torneo>();

  final List<Moto> fakeMotos = List.generate(3, (index) => Moto.fake(3));
  final RxList<Moto> topMotos = <Moto>[].obs;

  int get numPartecipazioni =>
      (user.value?.profile?.numVittorie ?? 0) +
      (user.value?.profile?.numSconfitte ?? 0);

  ProfileController({required this.provider});

  @override
  Future<void> onReady() async {
    super.onReady();
    ProfileArguments? argumentUser = Get.arguments as ProfileArguments?;
    initialize(argumentUser);
  }

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   await initialize(argumentUser);
  // }

  Future<void> initialize(ProfileArguments? argumentUser) async {
    await setUser(argumentUser);
    fetchClassificaTile();
    fetchTopMotos();
    fetchCoccarde();
  }

  Future<void> refreshInfo() async {
    initialize(
        ProfileArguments(user: user.value, profileId: user.value?.profile?.id));
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
    } else if (arguments.user != null) {
      user.value = arguments.user;
      setUserProfile();
      isOwnProfile.value = false;
      // se negli arguments c'e il profileId
    } else if (arguments.user == null && arguments.profileId != null) {
      user.value = await provider.fetchUserWithProfile(arguments.profileId!);
      isOwnProfile.value = false;
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

  Future<void> fetchClassificaTile() async {
    isFetchingClassificaTile.value = true;
    classificaTile.value =
        await provider.fetchClassificaTile(user.value!.profileId);
    isFetchingClassificaTile.value = false;
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
        //     text: "Collezione",
        //     index: 0,
        //     leftPadding: 0.0,
        //     rightPadding: 8.0,
        //     onPressed: () => changeIndex(0)),
        PaginationItem(
            text: 'medals'.tr,
            index: 0,
            leftPadding: 8.0,
            rightPadding: 8.0,
            onPressed: () => changeIndex(0)),
        PaginationItem(
            text: 'leaderboard'.tr,
            index: 1,
            leftPadding: 8.0,
            rightPadding: 0.0,
            onPressed: () => changeIndex(1)),
      ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
