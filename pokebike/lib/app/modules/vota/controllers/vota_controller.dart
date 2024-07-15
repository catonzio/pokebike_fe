import 'package:get/get.dart';
import 'package:pokebike/app/data/models/turno/turno.dart';
import 'package:pokebike/app/modules/vota/providers/vota_provider.dart';

class VotaController extends GetxController {
  final VotaProvider provider;

  final RxBool _isFetchingTurno = false.obs;
  bool get isFetchingTurno => _isFetchingTurno.value;
  set isFetchingTurno(bool value) => _isFetchingTurno.value = value;

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
}
