import 'package:get/get.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/leaderboard/providers/leaderboard_provider.dart';

class LeaderboardController extends GetxController {
  static LeaderboardController get to => Get.find<LeaderboardController>();

  final RxBool _isFetchingLeaderboard = false.obs;
  bool get isFetchingLeaderboard => _isFetchingLeaderboard.value;
  set isFetchingLeaderboard(bool value) => _isFetchingLeaderboard.value = value;

  final RxBool _isFetchingWinner = false.obs;
  bool get isFetchingWinner => _isFetchingWinner.value;
  set isFetchingWinner(bool value) => _isFetchingWinner.value = value;

  final RxBool _isShowingWinner = false.obs;
  bool get isShowingWinner => _isShowingWinner.value;
  set isShowingWinner(bool value) => _isShowingWinner.value = value;

  final RxBool _isLeaderboardList = false.obs;
  bool get isLeaderboardList => _isLeaderboardList.value;
  set isLeaderboardList(bool value) => _isLeaderboardList.value = value;

  final List<Partecipazione> fakeLeaderboard =
      List.generate(4, (index) => Partecipazione.fake(index));
  final RxList<Partecipazione> leaderboard = <Partecipazione>[].obs;

  final Rxn<User> winner = Rxn();

  final LeaderboardProvider provider;

  LeaderboardController({required this.provider});

  @override
  void onInit() {
    super.onInit();
    fetchLeaderboard();
  }

  Future<void> fetchLeaderboard() async {
    isFetchingLeaderboard = true;
    List<Partecipazione> leaderboard = await provider.fetchLeaderboard();
    this.leaderboard.addAll(leaderboard);
    // await Future.delayed(const Duration(seconds: 3));
    // leaderboard
    //     .addAll(List.generate(20, (index) => Partecipazione.fake(index + 1)));
    isFetchingLeaderboard = false;
  }

  Future<void> fetchWinner() async {
    isFetchingWinner = true;
    User? winner = await provider.fetchWinner();
    if (winner != null) {
      this.winner.value = winner;
    }
    isFetchingWinner = false;
  }

  Future<void> refreshLeaderboard() async {
    leaderboard.clear();
    return await fetchLeaderboard();
  }

  void showWinner() {
    isShowingWinner = true;
  }

  void showLeaderboard() {
    isShowingWinner = false;
  }
}
