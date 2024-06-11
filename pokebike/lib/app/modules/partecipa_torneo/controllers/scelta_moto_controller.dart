import 'package:get/get.dart';

class SceltaMotoController extends GetxController {
  final RxBool isMotoChosen = false.obs;
  final RxInt motoIndex = 0.obs;

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
