import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/api_response.dart';

class ApiPaginationController<T> extends GetxController {
  ScrollController scrollController = ScrollController();

  final RxBool _isFetchingOthers = false.obs;
  bool get isFetchingOthers => _isFetchingOthers.value;
  set isFetchingOthers(bool value) => _isFetchingOthers.value = value;

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;
  set isFetching(bool value) => _isFetching.value = value;

  final RxBool _showFAB = false.obs;
  bool get showFAB => _showFAB.value;
  set showFAB(bool value) => _showFAB.value = value;

  final RxList<T> list = <T>[].obs;

  final int limit = 50;
  int skip = 0;

  final Future<List<T>> Function(int?, int?) providerFunc;
  Future<void> Function() afterInit;

  ApiPaginationController({
    required this.providerFunc,
    Future<void> Function()? afterInit, // Nullable parameter
  }) : afterInit = afterInit ?? _defaultAfterInit;

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(_scrollListener);
    await initialFetch();
    afterInit();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  static Future<void> _defaultAfterInit() async {}

  Future<ApiResponse> initialFetch({bool reload = false}) async {
    // print(
    //     "This $hashCode, scroll controller ${scrollController.hashCode}. Has clients? ${scrollController.hasClients}");
    if (list.isNotEmpty && !reload) {
      return ApiResponse.success(message: "Success", data: list);
    }

    isFetching = true;
    list.clear();
    final List<T> fetchedList = await providerFunc(limit, skip);
    if (list.isEmpty) {
      list.addAll(fetchedList);
    }
    isFetching = false;

    return fetchedList.isEmpty
        ? ApiResponse.error(message: "Errore nel caricamento", data: null)
        : ApiResponse.success(message: "Success", data: list);
  }

  Future<void> refreshList() async {
    // list.clear();
    skip = 0;
    await initialFetch(reload: true);
    afterInit();
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
    if (offset >= Constants.fabOffset) {
      showFAB = true;
    } else {
      showFAB = false;
    }

    if (offset == maxOffset) {
      fetchOthers();
      // scrollController.jumpTo(offset - offset / 1.5);
    }
  }
}
