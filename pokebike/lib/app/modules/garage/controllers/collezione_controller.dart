import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/enums/order_by.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/controllers/searchable_list_controller.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

List<CollezioneMoto> _processList(List args) {
  List<CollezioneMoto> list =
      (args[0] as List).map((el) => CollezioneMoto.fromJson(el)).toList();
  List<Moto> motos = (args[1] as List).map((el) => Moto.fromJson(el)).toList();
  // List<Moto> motos = GarageWController.to.list;
  final motoMap = {
    for (Moto moto in motos)
      '${moto.marcaMoto.nome}-${moto.tipoMoto.nome}-${moto.nome.toLowerCase()}':
          moto
  };

  for ((int, CollezioneMoto) element in list.indexed) {
    int index = element.$1;
    CollezioneMoto collezioneMoto = element.$2;
    final key =
        '${collezioneMoto.marcaMoto.nome}-${collezioneMoto.tipoMoto.nome}-${collezioneMoto.modello.toLowerCase()}';
    if (motoMap.containsKey(key)) {
      list[index] = collezioneMoto.copyWith(moto: motoMap[key]);
    }
  }
  return list;
}

class CollezioneController extends SearchableListController<CollezioneMoto> {
  final MotoProvider provider;
  final List<CollezioneMoto> fakeList =
      List.generate(3, (index) => CollezioneMoto.fake(index));

  CollezioneController({required this.provider})
      : super(
          searchFilterFunc: (CollezioneMoto el, String value) =>
              (el.moto?.nome.toLowerCase().contains(value) ?? false) ||
              el.marcaMoto.nome.toLowerCase().contains(value) ||
              el.tipoMoto.nome.toLowerCase().contains(value) ||
              el.modello.toLowerCase().contains(value),
          marcaFilterFunc: (CollezioneMoto el, List<String> values) =>
              values.contains(el.marcaMoto.nome),
          tipoFilterFunc: (CollezioneMoto el, List<String> values) =>
              values.contains(el.tipoMoto.nome),
          orderByFilterFunc: (List<CollezioneMoto> els, OrderBy orderBy) => els,
          providerFunc: provider.fetchCollezioneMoto,
        ) {
    afterInit = _afterInit;
  }

  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    skip = 0;
    super.onInit();
  }

  late Worker listWorker;
  late Worker motosWorker;

  @override
  Future<List<CollezioneMoto>> fetchOthers() async {
    return [];
  }

  Future<void> _afterInit() async {
    if (list.isEmpty) return;
    // final GarageWController controller = GarageWController.to;
    List<Moto> motos = await provider.fetchMotos(isGarage: false);
    // _processList([list, motos]);

    print("START");
    print("${list.length}, ${motos.length}");
    await compute(_processList, [
      list.map((e) => e.toJson()).toList(),
      motos.map((e) => e.toJson()).toList()
    ]).then((e) {
      if (e.isNotEmpty) {
        list.clear();
        list.addAll(e);
      }
    });
    print("DONE");
    // await compute(_processList,
    //     [list as List<CollezioneMoto>, controller.list as List<Moto>]);
  }
}
