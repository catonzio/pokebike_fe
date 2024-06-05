import 'package:get/get.dart';

class FilterBoxController extends GetxController {
  final String title;

  final RxBool isExpanded = false.obs;
  final List<String> options;
  final RxList<String> selectedOptions = <String>[].obs;

  FilterBoxController({required this.title, required this.options});

  void toggle() => isExpanded.value = !isExpanded.value;

  void close() => isExpanded.value = false;

  void addOption(String option) => selectedOptions.add(option);

  RxBool isSelected(String option) => selectedOptions.contains(option).obs;

  void toggleCheckbox(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
  }

  void reset() {
    selectedOptions.clear();
    isExpanded.value = false;
  }
}
