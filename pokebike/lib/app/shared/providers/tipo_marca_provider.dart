import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/marca_moto/marca_moto.dart';
import 'package:moto_hunters/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';

class TipoMarcaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<List<TipoMoto>> fetchTipos() async {
    ApiResponse response =
        await handleApiEndpoint(request, "get", "/tipo-motos");
    if (response.success) {
      return (response.data as List).map((e) => TipoMoto.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<MarcaMoto>> fetchMarcas() async {
    ApiResponse response =
        await handleApiEndpoint(request, "get", "/marca-motos");
    if (response.success) {
      return (response.data as List).map((e) => MarcaMoto.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<String>> fetchModelli() async {
    ApiResponse response = await handleApiEndpoint(
        //?tipoId=11&marcaId=2
        request,
        "get",
        "/collezione-motos/modello");
    if (response.success) {
      return (response.data as List).map<String>((dynamic e) => e).toList();
    } else {
      return [];
    }
  }

  Future<List<TipoMoto>> fetchTiposMarcaId(int marcaId) async {
    ApiResponse response = await handleApiEndpoint(request, "get",
        "/collezione-motos/tipo-from-marca?marcaId=$marcaId&names=true");
    if (response.success) {
      return (response.data as List).map((e) => TipoMoto.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<String>> fetchModelloFromMarcaId(int marcaId) async {
    ApiResponse response = await handleApiEndpoint(
        request, "get", "/collezione-motos/modello?marcaId=$marcaId");
    if (response.success) {
      return (response.data as List).map((el) => el as String).toList();
    } else {
      return [];
    }
  }

  Future<TipoMoto> fetchTipoFromMarcaModello(
      int marcaId, String modello) async {
    ApiResponse response = await handleApiEndpoint(request, "get",
        "/collezione-motos/tipo-marca-modello?marcaId=$marcaId&modello=$modello");
    if (response.success) {
      return TipoMoto.fromJson(response.data);
    } else {
      return const TipoMoto(id: 0, nome: "");
    }
  }

  Future<CollezioneMoto?> fetchCollezioneMotoFromMarcaModello(
      int marcaId, String modello) async {
    ApiResponse response = await handleApiEndpoint(request, "get",
        "/collezione-motos?marcaId=$marcaId&modello=$modello");
    if (response.success && response.data is List && (response.data as List).isNotEmpty) {
      return CollezioneMoto.fromJson((response.data as List).first);
    } else {
      return null;
    }
  }
}
