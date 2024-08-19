// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/models/partecipazione/partecipazione.dart';
import 'package:pokebike/app/data/models/profile/profile.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class ProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
  }

  Future<ApiResponse> fetchUserMeEndpoint() async {
    return handleApiEndpoint(request, "get", "/users/me");
  }

  Future<ApiResponse> fetchProfileEndpoint(int profileId) async {
    return handleApiEndpoint(request, "get", "/profiles/$profileId");
  }

  Future<ApiResponse> fetchTopMotosEndpoint(int? profileId) async {
    return handleApiEndpoint(request, "get",
        "/motos/most-winners${profileId != null ? "/$profileId" : ""}");
  }

  Future<ApiResponse> fetchLastPartecipazioneEndpoint(int? profileId) async {
    return handleApiEndpoint(request, "get",
        "/partecipaziones/last-of-profile${profileId != null ? "/$profileId" : ""}");
  }

  Future<ApiResponse> fetchUserWithProfileEndpoint(int profileId) async {
    return handleApiEndpoint(request, "get", "/users/profile/$profileId");
  }

  Future<ApiResponse> fetchCockadesEndpoint(int profileId) async {
    return handleApiEndpoint(
        request, "get", "/profiles/$profileId/motos-by-type");
  }

  Future<User?> fetchUserMe() async {
    ApiResponse response = await fetchUserMeEndpoint();
    if (response.success) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<Profile?> fetchProfile(int id) async {
    ApiResponse response = await fetchProfileEndpoint(id);
    if (response.success) {
      return Profile.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<Moto>> fetchTopMotos(int? id) async {
    ApiResponse response = await fetchTopMotosEndpoint(id);
    if (response.success) {
      return (response.data as List).map((e) => Moto.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Partecipazione?> fetchLastPartecipazione(int? profileId) async {
    ApiResponse response = await fetchLastPartecipazioneEndpoint(profileId);
    if (response.success) {
      return Partecipazione.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<User?> fetchUserWithProfile(int profileId) async {
    ApiResponse response = await fetchUserWithProfileEndpoint(profileId);
    if (response.success) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }

  // Future<Map<String, int>> fetchCockades(int profileId) async {
  //   Map<String, int> emptyResult = {
  //     for (String k in Constants.filterBoxes['Tipo']!) k: 0
  //   };
  //   try {
  //     ApiResponse response = await fetchCockadesEndpoint(profileId);
  //     if (response.success) {
  //       if ((response.data.runtimeType == List) &&
  //           (response.data as List).isEmpty) {
  //         return emptyResult;
  //       }
  //       Map<String, int> result = {};
  //       for (String k in Constants.filterBoxes['Tipo']!) {
  //         int value = (response.data as Map<String, dynamic>)[k] ?? 0;
  //         result[k] = value;
  //       }

  //       return result;
  //     } else {
  //       return emptyResult;
  //     }
  //   } on Exception catch (_) {
  //     return emptyResult;
  //   }
  // }

  Future<Map<String, int>> fetchCockades(int profileId) async {
    ApiResponse response = await fetchCockadesEndpoint(profileId);
    Map<String, int> result = (response.data as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value));

    // for (String k in Constants.filterBoxes['Tipo']!) {
    //   int value = (response.data as Map<String, dynamic>)[k] ?? 0;
    //   result[k] = value;
    // }

    return result;
  }
}
