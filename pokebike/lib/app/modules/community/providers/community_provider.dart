import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class CommunityProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<List<User>> getUsers(int? limit, int? skip) async {
    String suffix = (limit != null ? "limit=$limit" : "") + (skip != null ? "&skip=$skip" : "");

    final ApiResponse response =
        await handleApiEndpoint(request, "get", '/users?$suffix');
    if (response.success) {
      return (response.data as List).map((e) => User.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
