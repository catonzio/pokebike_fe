import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/turno/turno.dart';
import 'package:pokebike/app/modules/vota/providers/vota_provider.dart';

class VotaController extends GetxController {
  final VotaProvider provider;

  final RxBool _isFetchingTurno = false.obs;
  bool get isFetchingTurno => _isFetchingTurno.value;
  set isFetchingTurno(bool value) => _isFetchingTurno.value = value;

  final RxBool hasVoted = false.obs;
  final RxDouble percentage = 0.0.obs;

  final Rxn<Turno> turno = Rxn<Turno>();

  VotaController({required this.provider});

  @override
  void onInit() {
    super.onInit();
    fetchTurno();
  }

  Future<void> fetchTurno() async {
    isFetchingTurno = true;
    turno.value = await provider.fetchTurno();
    isFetchingTurno = false;
  }

  Future<ApiResponse> vota(bool partecipazione1) async {
    ApiResponse response =
        await provider.vote(turno.value!.id, partecipazione1);
    if (response.success) {
      hasVoted.value = true;
      if (partecipazione1) {
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
