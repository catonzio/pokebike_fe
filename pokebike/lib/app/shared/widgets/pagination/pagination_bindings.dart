import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/widgets/pagination/pagination_controller.dart';

class PaginationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PaginationController());
  }
}
