import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/classifica_tile/classifica_tile.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/leaderboard/providers/leaderboard_provider.dart';
import 'package:pokebike/app/shared/controllers/api_pagination_controller.dart';

class LeaderboardController extends ApiPaginationController<ClassificaTile> {
  static LeaderboardController get to => Get.find<LeaderboardController>();

  // final RxBool _isFetchingLeaderboard = false.obs;
  // bool get isFetchingLeaderboard => _isFetchingLeaderboard.value;
  // set isFetchingLeaderboard(bool value) => _isFetchingLeaderboard.value = value;

  final RxBool _isFetchingWinner = false.obs;
  bool get isFetchingWinner => _isFetchingWinner.value;
  set isFetchingWinner(bool value) => _isFetchingWinner.value = value;

  final RxBool _isShowingWinner = false.obs;
  bool get isShowingWinner => _isShowingWinner.value;
  set isShowingWinner(bool value) => _isShowingWinner.value = value;

  final RxBool _isLeaderboardList = false.obs;
  bool get isLeaderboardList => _isLeaderboardList.value;
  set isLeaderboardList(bool value) => _isLeaderboardList.value = value;

  final List<ClassificaTile> fakeLeaderboard =
      List.generate(4, (index) => ClassificaTile.fake(index));

  final Rxn<User> winner = Rxn();

  final LeaderboardProvider provider;

  LeaderboardController({required this.provider})
      : super(providerFunc: provider.fetchLeaderboard);

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }

  // Future<void> fetchLeaderboard() async {
  //   isFetchingLeaderboard = true;
  //   List<ClassificaTile> leaderboard = await provider.fetchLeaderboard();
  //   this.leaderboard.addAll(leaderboard);
  //   // await Future.delayed(const Duration(seconds: 3));
  //   // leaderboard
  //   //     .addAll(List.generate(20, (index) => ClassificaTile.fake(index + 1)));
  //   isFetchingLeaderboard = false;
  // }

  Future<void> fetchWinner() async {
    isFetchingWinner = true;
    User? winner = await provider.fetchWinner();
    if (winner != null) {
      this.winner.value = winner;
    }
    isFetchingWinner = false;
  }

  Future<void> refreshLeaderboard() async {
    // leaderboard.clear();
    // return await fetchLeaderboard();
  }

  void showWinner() {
    isShowingWinner = true;
  }

  void showLeaderboard() {
    isShowingWinner = false;
  }
}
