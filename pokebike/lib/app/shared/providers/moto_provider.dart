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

  Future<List<Moto>> fetchMotos(int? limit, int? skip) async {
    String suffix = (limit != null ? "limit=$limit" : "") +
        (skip != null ? "&skip=$skip" : "");

    ApiResponse response =
        await handleApiEndpoint(request, "get", "/motos?$suffix");
    if (response.success) {
      return (response.data as List).map((e) => Moto.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<ApiResponse> addMoto(Map<String, dynamic> data) {
    return handleApiEndpoint(request, "post", "/motos", data: data);
  }

  Future<List<CollezioneMoto>> fetchCollezioneMoto(
      int? limit, int? skip) async {
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

  Future<ApiResponse> updateMoto(int id, Map<String, dynamic> data) {
    return handleApiEndpoint(request, "put", "/motos/$id", data: data);
  }

  Future<ApiResponse> checkMotoDuplicate(
      int marcaMotoId, int tipoMotoId, String nome) {
    return handleApiEndpoint(request, "post", "/motos/check-exists", data: {
      'marca_moto_id': marcaMotoId,
      'tipo_moto_id': tipoMotoId,
      'nome': nome
    });
  }

  Future<ApiResponse> setFavorita(int motoId) {
    return handleApiEndpoint(request, "get", "/motos/set-favorita/$motoId");
  }

  Future<ApiResponse> createPartecipazione(int motoId, {int? profileId}) {
    return handleApiEndpoint(request, "post",
        "/partecipaziones?moto_id=$motoId${profileId != null ? "&profile_id=$profileId" : ""}");
  }

  Future<ApiResponse> checkAlreadyChosen() {
    return handleApiEndpoint(request, "get", "/partecipaziones/exists");
  }
}
