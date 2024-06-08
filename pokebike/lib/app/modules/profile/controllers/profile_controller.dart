import 'dart:math';

import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_item.dart';

class Torneo {}

class ProfileController extends GetxController {
  final RxInt selectedIndex = 2.obs;

  final RxBool isLoadingMedaglie = false.obs;
  final RxBool isLoadingCoccarde = false.obs;
  final RxBool isLoadingClassifica = false.obs;

  final RxList<String> fakeMedaglie = <String>["ciao", "a", "tutti"].obs;
  final RxList<String> medaglie = <String>[].obs;
  final Map<String, double> fakeCoccardeScore = <String, double>{
    for (var el in Constants.filterBoxes["Tipo"]!) el: 0.0
  };
  final Map<String, double> coccardeScore = <String, double>{}.obs;
  Rxn<Torneo> torneo = Rxn<Torneo>();

  ProfileController();

  @override
  onInit() {
    super.onInit();
    fetchMedaglie();
    fetchCoccarde();
  }

  void setTorneo(Torneo torneo) {
    isLoadingClassifica.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingClassifica.value = false;
      if (this.torneo.value == null) {
        this.torneo.value = torneo;
      }
    });
  }

  void fetchMedaglie() {
    isLoadingMedaglie.value = true;
    Future.delayed(const Duration(seconds: 7), () {
      isLoadingMedaglie.value = false;
      if (medaglie.isEmpty) {
        medaglie.addAll(fakeMedaglie);
      }
    });
  }

  void fetchCoccarde() {
    isLoadingCoccarde.value = true;
    Random random = Random();
    Future.delayed(const Duration(seconds: 5), () {
      isLoadingCoccarde.value = false;
      if (coccardeScore.isEmpty) {
        coccardeScore.addAll({
          for (var el in Constants.filterBoxes["Tipo"]!)
            el: random.nextInt(100) / 100
        });
      }
    });
  }

  bool get isGarage => selectedIndex.value == 0;
  bool get isMedaglie => selectedIndex.value == 1;
  bool get isClassifica => selectedIndex.value == 2;

  List<PaginationItem> get items => [
        PaginationItem(
            text: "Garage",
            index: 0,
            leftPadding: 0.0,
            rightPadding: 8.0,
            onPressed: () => changeIndex(0)),
        PaginationItem(
            text: "Medaglie",
            index: 1,
            leftPadding: 8.0,
            rightPadding: 8.0,
            onPressed: () => changeIndex(1)),
        PaginationItem(
            text: "Classifica",
            index: 2,
            leftPadding: 8.0,
            rightPadding: 0.0,
            onPressed: () => changeIndex(2)),
      ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
