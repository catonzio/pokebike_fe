import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/marca_moto/marca_moto.dart';
import 'package:pokebike/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

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
}
