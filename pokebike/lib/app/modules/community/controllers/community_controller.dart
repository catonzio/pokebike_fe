import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/community/providers/community_provider.dart';

class CommunityController extends GetxController {
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final List<User> fakeCommunities =
      List.generate(7, (index) => User.fake(index));
  final RxList<User> communities = <User>[].obs;
  RxList<User> filteredCommunities = <User>[].obs;

  final CommunityProvider _communityProvider;

  CommunityController(this._communityProvider);

  Future<ApiResponse> fetchUsers({bool reload = false}) async {
    if (communities.isNotEmpty && !reload) {
      return ApiResponse.success(data: communities, message: "Success");
    }

    isLoading = true;
    final ApiResponse response = await _communityProvider.getUsers();
    if (response.success) {
      final List<User> users =
          response.data.map<User>((e) => User.fromJson(e)).toList();
      communities.addAll(users);
    }
    filteredCommunities.value = communities;
    isLoading = false;
    return response;
  }

  void filterCommunities(String filter) {
    if (filter.isEmpty) {
      filteredCommunities.value = communities;
    } else {
      filteredCommunities.value = communities
          .where((element) =>
              fullName(element).toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }
}
