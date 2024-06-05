import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pokebike/app/shared/controllers/filter_box_controller.dart';

class FilterSheetController extends GetxController {
  final List<FilterBoxController> controllers;

  FilterSheetController({required this.controllers});

  void reset() {
    for (var controller in controllers) {
      controller.reset();
    }
  }

  Map<String, List<String>> getOptions() {
    return {
      for (var controller in controllers)
        controller.title: controller.selectedOptions
    };
  }
}
