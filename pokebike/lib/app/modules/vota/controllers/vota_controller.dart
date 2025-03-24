import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/turno/turno.dart';
import 'package:moto_hunters/app/modules/vota/providers/vota_provider.dart';

class VotaController extends GetxController {
  final VotaProvider provider;

  final RxBool _isFetchingTurno = false.obs;
  bool get isFetchingTurno => _isFetchingTurno.value;
  set isFetchingTurno(bool value) => _isFetchingTurno.value = value;

  final RxBool hasVoted = false.obs;
  final RxDouble percentage = 0.0.obs;

  final Rxn<Turno> turno = Rxn<Turno>();

  final RxString _errorMessage = "".obs;
  String get errorMessage => _errorMessage.value;
  set errorMessage(String value) => _errorMessage.value = value;

  VotaController({required this.provider});

  @override
  void onInit() {
    super.onInit();
    fetchTurno();
  }

  Future<void> fetchTurno() async {
    isFetchingTurno = true;

    try {
      turno.value = await provider.fetchTurno();
    } on Exception catch (e) {
      errorMessage = e.toString().replaceFirst("Exception: ", "");
    }
    isFetchingTurno = false;
  }

  Future<ApiResponse> vota(int toPartecipazioneId) async {
    if (hasVoted.value) {
      return ApiResponse.error(message: 'alreadyVoted'.tr, data: null);
    }

    ApiResponse response =
        await provider.vote(turno.value!.id, toPartecipazioneId);
    if (response.success) {
      hasVoted.value = true;
      if (toPartecipazioneId == turno.value!.partecipazione1.id) {
        turno.value = turno.value!.copyWith(
            partecipazione1: turno.value!.partecipazione1
                .copyWith(punti: turno.value!.partecipazione1.punti + 1),
            punti1: turno.value!.punti1 + 1);
      } else {
        turno.value = turno.value!.copyWith(
            partecipazione2: turno.value!.partecipazione2
                .copyWith(punti: turno.value!.partecipazione2.punti + 1),
            punti2: turno.value!.punti2 + 1);
      }
      percentage.value =
          turno.value!.punti1 / (turno.value!.punti1 + turno.value!.punti2);
    }
    return response;
  }
}
