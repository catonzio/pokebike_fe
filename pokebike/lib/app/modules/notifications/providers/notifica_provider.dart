import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/notifica/notifica.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class NotificaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
  }

  Future<List<Notifica>> fetchNotifiche(int? limit, int? skip) async {
    // return Future.delayed(
    //   const Duration(seconds: 1),
    //   () => List.generate(100, (index) => Notifica.fake(index)),
    // );

    String suffix = (limit != null ? "limit=$limit" : "") +
        (skip != null ? "&skip=$skip" : "");

    ApiResponse response =
        await handleApiEndpoint(request, "get", "/notificas?$suffix");

    if (response.success) {
      List<Notifica> notifiche =
          (response.data as List).map((el) => Notifica.fromJson(el)).toList();
      return notifiche;
    } else {
      return [];
    }
  }

  Future<ApiResponse> readNotifica(String id) async {
    ApiResponse response =
        await handleApiEndpoint(request, "post", "/notificas/read/$id");
    return response;
  }

  Future<ApiResponse> readAll() async {
    ApiResponse response =
        await handleApiEndpoint(request, "post", "/notificas/read-all");
    return response;
  }

  Future<ApiResponse> deleteAll() async {
    ApiResponse response =
        await handleApiEndpoint(request, "delete", "/notificas/null");
    return response;
  }

  Future<ApiResponse> deleteNotifica(String id) async {
    ApiResponse response =
        await handleApiEndpoint(request, "delete", "/notificas/$id");
    return response;
  }
}
