import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/shared/controllers/filter_box_controller.dart';
import 'package:pokebike/app/shared/controllers/filter_sheet_controller.dart';

class SearchRowBindings extends Bindings {
  @override
  void dependencies() {
    List<FilterBoxController> controllers = [];
    for (var key in Constants.filterBoxes.keys) {
      controllers.add(Get.put(
          FilterBoxController(title: key, options: Constants.filterBoxes[key]!),
          tag: key));
    }
    Get.lazyPut<FilterSheetController>(
        () => FilterSheetController(controllers: controllers));
  }
}
