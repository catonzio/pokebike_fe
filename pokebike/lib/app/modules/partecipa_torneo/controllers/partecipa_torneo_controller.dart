import 'package:get/get.dart';
import 'package:pokebike/app/shared/controllers/searchable_moto_controller.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

class PartecipaTorneoController extends SearchableMotoController {
  final RxBool isMotoChosen = false.obs;
  final RxInt motoIndex = 0.obs;
  set index(int value) => motoIndex.value = value;

  MotoProvider provider;

  PartecipaTorneoController({required this.provider})
      : super(fetchFunction: provider.fetchMotos);

  void chooseMoto(int index) {
    isMotoChosen.value = true;
    motoIndex.value = index;
    print("Moto scelta con successo! Index: $index");
  }

  void reset() {
    isMotoChosen.value = false;
    motoIndex.value = 0;
  }
}
