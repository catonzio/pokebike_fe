import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/leaderboard/providers/leaderboard_provider.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardBinding extends Bindings {
  @override
  void dependencies() {
    LeaderboardProvider provider =
        Get.put<LeaderboardProvider>(LeaderboardProvider());
    Get.lazyPut<LeaderboardController>(
        () => LeaderboardController(provider: provider));
  }
}
