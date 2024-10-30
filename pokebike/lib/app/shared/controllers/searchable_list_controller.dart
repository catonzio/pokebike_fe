import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/data/enums/order_by.dart';
import 'package:pokebike/app/data/search_options.dart';
import 'package:pokebike/app/shared/controllers/api_pagination_controller.dart';

class SearchableListController<T> extends ApiPaginationController<T> {
  final FocusNode focusNode = FocusNode();

  String lastSearch = "";
  SearchOptions lastOptions = const SearchOptions();

  RxList<T> filteredList = <T>[].obs;

  final bool Function(T, String) searchFilterFunc;
  final bool Function(T, List<String>) tipoFilterFunc;
  final bool Function(T, List<String>) marcaFilterFunc;
  final List<T> Function(List<T>, OrderBy) orderByFilterFunc;

  SearchableListController(
      {required this.searchFilterFunc,
      required this.tipoFilterFunc,
      required this.marcaFilterFunc,
      required this.orderByFilterFunc,
      required super.providerFunc,
      super.afterInit});

  @override
  Future<ApiResponse> initialFetch({bool reload = false}) async {
    ApiResponse response = await super.initialFetch(reload: reload);
    filteredList.value = list;
    return response;
  }

  @override
  Future<void> refreshList() async {
    filteredList.clear();
    super.refreshList();
  }

  @override
  Future<List<T>> fetchOthers() async {
    List<T> newElements = await super.fetchOthers();
    filteredList.addAll(newElements);
    return newElements;
  }

  List<T> filterSearch({String? value, List<T>? list}) {
    list = list ?? this.list;
    String searchS = value ?? lastSearch;
    lastSearch = value ?? lastSearch;
    if (searchS.isEmpty) {
      return this.list;
    }
    return list.where((el) => searchFilterFunc(el, searchS)).toList();
  }

  List<T> sortAndFilter({SearchOptions? options, List<T>? list}) {
    List<T> result = list ?? this.list;

    SearchOptions searchOptions = options ?? lastOptions;
    lastOptions = options ?? lastOptions;

    final bool hasTipo = searchOptions.tipo.isNotEmpty;
    final bool hasMarca = searchOptions.marca.isNotEmpty;

    result = result
        .where((el) =>
            (hasTipo ? tipoFilterFunc(el, searchOptions.tipo) : true) &&
            (hasMarca ? marcaFilterFunc(el, searchOptions.marca) : true))
        .toList();

    if (searchOptions.orderBy != OrderBy.none) {
      result = orderByFilterFunc(result, searchOptions.orderBy);
    }
    return result;
  }

  void filter({String? searchS, SearchOptions? options}) {
    filteredList.value = filterSearch(value: searchS);
    filteredList.value = sortAndFilter(options: options, list: filteredList);
    // if (searchS != null) {
    // }
    // if (options != null) {
    // }
  }
}
