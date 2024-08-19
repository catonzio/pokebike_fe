import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class MotoProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<List<Moto>> fetchMotos() async {
    ApiResponse response = await handleApiEndpoint(request, "get", "/motos");
    if (response.success) {
      return (response.data as List).map((e) => Moto.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<ApiResponse> addMoto(Map<String, dynamic> data) {
    return handleApiEndpoint(request, "post", "/motos", data: data);
  }

  Future<List<CollezioneMoto>> fetchCollezioneMoto() async {
    ApiResponse response =
        await handleApiEndpoint(request, 'get', '/collezione-motos');
    if (response.success) {
      return (response.data as List)
          .map((e) => CollezioneMoto.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
