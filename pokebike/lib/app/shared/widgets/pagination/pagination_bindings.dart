import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/pagination/pagination_controller.dart';

class PaginationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaginationController>(() => PaginationController());
  }
}
