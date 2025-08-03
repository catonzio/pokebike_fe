import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:moto_hunters/app/data/enums/order_by.dart';
// import 'package:moto_hunters/app/data/enums/order_by.dart';
import 'package:moto_hunters/app/data/search_options.dart';
import 'package:moto_hunters/app/shared/controllers/filter_box_controller.dart';
import 'package:get/get.dart';

class FilterSheetController extends GetxController {
  final Map<String, FilterBoxController> controllers;
  final RxBool possedute = false.obs;

  FilterSheetController({required this.controllers});

  void reset() {
    for (var controller in controllers.values) {
      controller.reset();
    }
    possedute.value = false;
  }

  SearchOptions getOptions() {
    return SearchOptions(
        // orderBy: controllers['ordinaPer']?.selectedOptions ?? OrderBy.none,
        tipo: controllers['tipo']?.selectedOptions,
        marca: controllers['marca']?.selectedOptions,
        possedute: possedute.value);
    // return {
    //   for (var controller in controllers)
    //     controller.title: controller.selectedOptions
    // };
  }
}
