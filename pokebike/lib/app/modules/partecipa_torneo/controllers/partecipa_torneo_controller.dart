import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/controllers/searchable_moto_controller.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

class PartecipaTorneoController extends SearchableMotoController {
  final RxBool isMotoChosen = false.obs;
  final RxInt motoIndex = 0.obs;
  set index(int value) => motoIndex.value = value;

  final RxBool isChoosing = false.obs;

  MotoProvider provider;

  PartecipaTorneoController({required this.provider})
      : super(fetchFunction: provider.fetchMotos);

  @override
  Future<void> onReady() async {
    super.onReady();
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
