import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/turno/turno.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

class VotaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
  }

  Future<Turno?> fetchTurno() async {
    ApiResponse response =
        await handleApiEndpoint(request, 'get', '/torneos/last-votazione');
    if (response.success) {
      return Turno.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ApiResponse> vote(int turnoId, bool partecipazione1) async {
    ApiResponse response = await handleApiEndpoint(request, 'get',
        '/turnos/vote?turno_id=$turnoId&partecipazione1=$partecipazione1');
    return response;
  }
}
