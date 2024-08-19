import 'package:get/get.dart';
import 'package:pokebike/app/shared/controllers/filter_box_controller.dart';
import 'package:pokebike/app/shared/controllers/filter_sheet_controller.dart';
import 'package:pokebike/app/shared/controllers/tipo_marca_controller.dart';

class SearchRowBindings extends Bindings {
  @override
  void dependencies() {
    // Map<String, FilterBoxController> controllers = Constants.filterBoxes.map(
    //     (key, value) => MapEntry(
    //         key.toLowerCase(),
    //         Get.put(FilterBoxController(title: key, options: value ?? []),
    //             tag: key)));
    Map<String, FilterBoxController> controllers = {
      'ordinaPer': Get.put(
          FilterBoxController(
              title: 'ordinaPer', options: ['Più recenti', 'Dalla A alla Z']),
          tag: 'Ordina per'),
      'tipo': Get.put(
          FilterBoxController(
              title: 'Tipo', options: TipoMarcaController.to.nomiTipi),
          tag: 'tipo'),
      'marca': Get.put(
          FilterBoxController(
              title: 'Marca', options: TipoMarcaController.to.nomiMarche),
          tag: 'marca')
    };
    Get.lazyPut<FilterSheetController>(
        () => FilterSheetController(controllers: controllers));
  }
}
