import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class CommunityProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 10);
  }

  Future<ApiResponse> getUsers() async {
    final ApiResponse response =
        await handleApiEndpoint(request, "get", '/users');

    return response;
  }
}
