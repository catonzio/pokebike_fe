import 'package:flutter/material.dart';
import 'package:pokebike/app/data/enums/order_by.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/controllers/searchable_list_controller.dart';

class SearchableMotoController extends SearchableListController<Moto> {
  final Future<List<Moto>> Function(int?, int?) fetchFunction;
  final List<Moto> fakeList = List.generate(3, (index) => Moto.fake(index));

  SearchableMotoController({required this.fetchFunction})
      : super(
            searchFilterFunc: (Moto el, String value) =>
                el.nome.toLowerCase().contains(value.toLowerCase()),
            tipoFilterFunc: (Moto el, List<String> values) =>
                values.contains(el.tipoMoto.nome),
            marcaFilterFunc: (Moto el, List<String> values) =>
                values.contains(el.marcaMoto.nome),
            orderByFilterFunc: (List<Moto> els, OrderBy value) {
              if (value == OrderBy.alphabet) {
                els.sort((m1, m2) =>
                    m1.nome.toLowerCase().compareTo(m2.nome.toLowerCase()));
                return els;
              }
              if (value == OrderBy.recent) {
                els.sort((m1, m2) => m1.dataCattura.compareTo(m2.dataCattura));
                return els;
              }
              return els;
            },
            providerFunc: fetchFunction);

  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    super.onInit();
  }

  // void fetch() {
  //   initialFetch();
  // }

  // Future<void> refreshList() async {
  //   list.clear();
  //   filteredList.clear();
  //   await initialFetch();
  // }
}
