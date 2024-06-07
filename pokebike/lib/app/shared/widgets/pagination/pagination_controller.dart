import 'package:get/get.dart';

class PaginationController extends GetxController {
  final _currentPage = 2.obs;
  final _totalPages = 0.obs;

  int get currentPage => _currentPage.value;
  int get totalPages => _totalPages.value;

  void setCurrentPage(int page) {
    _currentPage.value = page;
  }

  void setTotalPages(int pages) {
    _totalPages.value = pages;
  }
}