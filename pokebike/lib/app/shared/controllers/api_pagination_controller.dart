import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';

class ApiPaginationController<T> extends GetxController {
  final ScrollController scrollController = ScrollController();

  final RxBool _isFetchingOthers = false.obs;
  bool get isFetchingOthers => _isFetchingOthers.value;
  set isFetchingOthers(bool value) => _isFetchingOthers.value = value;

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;
  set isFetching(bool value) => _isFetching.value = value;

  final RxList<T> list = <T>[].obs;

  final int limit = 50;
  int skip = 0;

  final Future<List<T>> Function(int?, int?) providerFunc;

  ApiPaginationController({required this.providerFunc});

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    initialFetch();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<ApiResponse> initialFetch({bool reload = false}) async {
    if (list.isNotEmpty && !reload) {
      return ApiResponse.success(message: "Success", data: list);
    }

    isFetching = true;
    list.clear();
    final List<T> fetchedList = await providerFunc(limit, skip);
    list.addAll(fetchedList);
    isFetching = false;

    return fetchedList.isEmpty
        ? ApiResponse.error(message: "Errore nel caricamento", data: null)
        : ApiResponse.success(message: "Success", data: list);
  }

  Future<void> refreshList() async {
    list.clear();
    await initialFetch(reload: true);
  }

  Future<List<T>> fetchOthers() async {
    isFetchingOthers = true;
    skip += limit;
    final List<T> newElements = await providerFunc(limit, skip);
    list.addAll(newElements);
    isFetchingOthers = false;
    return newElements;
  }

  Future<void> _scrollListener() async {
    final offset = scrollController.offset;
    final maxOffset = scrollController.position.maxScrollExtent;
    if (offset >= (maxOffset)) {
      fetchOthers();
      // scrollController.jumpTo(offset - offset / 1.5);
    }
  }
}
