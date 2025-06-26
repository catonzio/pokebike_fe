import 'package:get/get.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/shared/controllers/searchable_moto_controller.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';

class PartecipaTorneoController extends SearchableMotoController {
  final RxBool isMotoChosen = false.obs;
  final RxInt motoIndex = 0.obs;
  set index(int value) => motoIndex.value = value;

  final RxBool isChoosing = false.obs;

  MotoProvider provider;

  PartecipaTorneoController({required this.provider})
      : super(
            fetchFunction: (l, s) =>
                provider.fetchMotos(limit: l, skip: s, isGarage: true));

  @override
  Future<void> onReady() async {
    // Ricarica sempre la lista delle moto dal backend
    await initialFetch(reload: true);
    await setIsChosen();
  }

  Future<void> setIsChosen() async {
    Moto? moto = await provider.checkAlreadyChosen();
    isMotoChosen.value = moto != null;
    motoIndex.value = moto?.id ?? 0;
    if (moto != null) {
      list.add(moto);
      filteredList.add(moto);
    }
  }

  Future<ApiResponse> chooseMoto(int motoId) async {
    final ApiResponse response = await provider.createPartecipazione(motoId);

    if (response.success) {
      isMotoChosen.value = true;
      motoIndex.value = motoId;
      filteredList.value = list;
    }

    return response;
  }

  void reset() {
    isMotoChosen.value = false;
    motoIndex.value = 0;
  }
}
