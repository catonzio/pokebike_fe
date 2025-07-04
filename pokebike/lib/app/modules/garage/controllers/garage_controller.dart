import 'package:get/get.dart';
import 'package:moto_hunters/app/data/enums/garage_type.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/modules/garage/controllers/collezione_controller.dart';
import 'package:moto_hunters/app/modules/garage/controllers/garage_w_controller.dart';
import 'package:moto_hunters/app/modules/profile/providers/profile_provider.dart';

class GarageController extends GetxController {
  final RxBool isShowingGarage = true.obs;

  final GarageWController garageWController;
  final CollezioneController collezioneController;

  final Rxn<User> user = Rxn<User>();
  // Flag per mostrare solo una volta il dialog iniziale
  final RxBool hasShownInitialInfo = false.obs;

  GarageController(
      {required this.garageWController, required this.collezioneController});

  @override
  void onInit() {
    super.onInit();
    // isShowingGarage.value = Get.arguments == GarageType.garage;
    toggleShowing(Get.arguments == GarageType.garage);
    fetchUser();
  }

  Future<void> fetchUser() async {
    user.value = await Get.find<ProfileProvider>().fetchUserMe();
  }

  Future<void> refreshList() async {
    if (isShowingGarage.value) {
      await garageWController.refreshList();
    } else {
      await collezioneController.refreshList();
    }
  }

  void toggleShowing(bool value) {
    isShowingGarage.value = value;
    if (!value && collezioneController.list.isEmpty) {
      collezioneController.initialFetch();
      collezioneController.afterInit();
    } else if (value && garageWController.list.isEmpty) {
      garageWController.initialFetch();
    }
  }
}
