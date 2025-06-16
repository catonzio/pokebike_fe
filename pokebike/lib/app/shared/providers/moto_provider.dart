import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class MotoProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<List<Moto>> fetchMotos(
      {int? limit, int? skip, int? profileId, bool isGarage = false}) async {
    final params = <String>[];
    if (profileId != null) params.add("profile_id=$profileId");
    if (limit != null) params.add("limit=$limit");
    if (skip != null) params.add("skip=$skip");
    //if (isGarage) params.add("is_garage=$isGarage");
    final query = params.isNotEmpty ? "?${params.join("&")}" : "";
    final ApiResponse response =
        await handleApiEndpoint(request, "get", "/motos$query");
    if (response.success &&
        response.data is List &&
        (response.data as List).isNotEmpty) {
      log('First Moto JSON: ${jsonEncode((response.data as List).first)}');
    }
    if (response.success) {
      return (response.data as List).map((e) => Moto.fromJson(e)).toList();
    }
    return [];
  }

  Future<Moto?> fetchMoto(int id) async {
    final ApiResponse response =
        await handleApiEndpoint(request, "get", "/motos/$id");
    if (response.success && response.data != null) {
      return Moto.fromJson(response.data);
    }
    return null;
  }

  Future<List<Moto>> fetchMostWinners({int? profileId}) async {
    final path = profileId != null
        ? "/motos/most-winners/$profileId"
        : "/motos/most-winners";
    final ApiResponse response = await handleApiEndpoint(request, "get", path);
    if (response.success) {
      return (response.data as List).map((e) => Moto.fromJson(e)).toList();
    }
    return [];
  }

  Future<ApiResponse> deleteMoto(int id) async {
    return handleApiEndpoint(request, "delete", "/motos/$id");
  }

  Future<ApiResponse> updateMoto(int id, Map<String, dynamic> data) async {
    return handleApiEndpoint(request, "patch", "/motos/$id", data: data);
  }

  Future<ApiResponse> updateMotoWithImages(
      int motoId, Map<String, dynamic> data) async {
    log('=== UPDATE MOTO WITH IMAGES ===');
    log('Moto ID: $motoId');
    log('Data keys: ${data.keys.toList()}');

    // Log dettagliato delle immagini
    if (data.containsKey('images')) {
      final images = data['images'];
      log('Images type: ${images.runtimeType}');
      if (images is Iterable) {
        log('Images count: ${images.length}');
        for (int i = 0; i < images.length; i++) {
          final img = images.elementAt(i);
          log('Image $i: ${img.runtimeType} - ${img.toString()}');
        }
      }
    }

    final formData = FormData(castXFileMultipart(data));

    // Log del FormData finale
    log('=== FORM DATA FINALE ===');
    formData.fields.forEach((field) {
      log('Field: ${field.key} = ${field.value}');
    });
    formData.files.forEach((file) {
      log('File: ${file.key} = ${file.value.filename}');
    });

    final response = await handleApiEndpoint(request, "put", '/motos/$motoId',
        data: formData);

    return response;
  }

  // Aggiunge una nuova immagine ad una moto (POST /motos/{id}/images)
  Future<ApiResponse> addMotoImage(int motoId, XFile image) async {
    final Map<String, dynamic> payload = {
      'image': image,
    };
    final formData = FormData(castXFileMultipart(payload));
    return handleApiEndpoint(request, 'post', '/motos/$motoId/images',
        data: formData);
  }

  // Rimuove una immagine esistente dalla moto (DELETE /motos/{id}/images/{mediaId})
  Future<ApiResponse> deleteMotoImage(int motoId, int mediaId) async {
    return handleApiEndpoint(
        request, 'delete', '/motos/$motoId/images/$mediaId');
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

  Future<Moto?> checkAlreadyChosen() async {
    ApiResponse response =
        await handleApiEndpoint(request, "get", "/partecipaziones/exists");
    if (response.success) {
      return Moto.fromJson(response.data);
    } else {
      return null;
    }
  }
}
