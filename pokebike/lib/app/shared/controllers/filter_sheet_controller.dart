import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:pokebike/app/data/enums/order_by.dart';
import 'package:pokebike/app/data/search_options.dart';
import 'package:pokebike/app/shared/controllers/filter_box_controller.dart';

class FilterSheetController extends GetxController {
  final Map<String, FilterBoxController> controllers;

  FilterSheetController({required this.controllers});

  void reset() {
    for (var controller in controllers.values) {
      controller.reset();
    }
  }

  SearchOptions getOptions() {
    // orderBy: controllers['orderBy']?.selectedOptions ?? OrderBy.none,
    return SearchOptions(
        tipo: controllers['tipo']?.selectedOptions,
        marca: controllers['marca']?.selectedOptions);
    // return {
    //   for (var controller in controllers)
    //     controller.title: controller.selectedOptions
    // };
  }
}
