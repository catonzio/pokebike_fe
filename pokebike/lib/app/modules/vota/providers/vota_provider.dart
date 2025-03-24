import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/turno/turno.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';

class VotaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
  }

  Future<Turno?> fetchTurno() async {
    ApiResponse response =
        await handleApiEndpoint(request, 'get', '/torneos/votazione');
    if (response.success) {
      return Turno.fromJson(response.data);
    } else {
      throw Exception(response.message);
    }
  }

  Future<ApiResponse> vote(int turnoId, int toPartecipazioneId) async {
    print('?turno_id=$turnoId&to_partecipazione_id=$toPartecipazioneId');
    ApiResponse response = await handleApiEndpoint(request, 'post',
        '/votaziones/vota?turno_id=$turnoId&to_partecipazione_id=$toPartecipazioneId');
    return response;
  }
}
