import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/classifica_tile/classifica_tile.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class LeaderboardProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
  }

  Future<User?> fetchWinner() async {
    ApiResponse response =
        await handleApiEndpoint(request, 'get', '/torneos/last-winner');
    if (response.success) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<ClassificaTile>> fetchLeaderboard() async {
    ApiResponse response =
        await handleApiEndpoint(request, 'get', '/profiles/leaderboard');
    if (response.success) {
      return (response.data as List)
          .map<ClassificaTile>((e) => ClassificaTile.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
