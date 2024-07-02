import 'package:get/get.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';

class LeaderboardController extends GetxController {
  static LeaderboardController get to => Get.find<LeaderboardController>();

  final RxBool _isShowingWinner = false.obs;
  bool get isShowingWinner => _isShowingWinner.value;
  set isShowingWinner(bool value) => _isShowingWinner.value = value;

  final RxBool _isLeaderboardList = true.obs;
  bool get isLeaderboardList => _isLeaderboardList.value;
  set isLeaderboardList(bool value) => _isLeaderboardList.value = value;

  final List<Partecipazione> fakeLeaderboard =
      List.generate(4, (index) => Partecipazione.fake(index));
  final RxList<Partecipazione> leaderboard = <Partecipazione>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderboard();
  }

  void fetchLeaderboard() async {
    await Future.delayed(const Duration(seconds: 3));
    leaderboard
        .addAll(List.generate(20, (index) => Partecipazione.fake(index + 1)));
  }

  void showWinner() {
    isShowingWinner = true;
  }

  void showLeaderboard() {
    isShowingWinner = false;
  }
}
