import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokebike/app/data/enums/order_by.dart';
import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/garage/controllers/garage_w_controller.dart';
import 'package:pokebike/app/shared/controllers/searchable_list_controller.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

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
  void onInit() {
    scrollController = ScrollController();
    skip = 0;
    super.onInit();
  }

  @override
  Future<List<CollezioneMoto>> fetchOthers() async {
    return [];
  }

  Future<void> _afterInit() async {
    final GarageWController controller = GarageWController.to;
    final List<Moto> motos = controller.list;

    // Run in an isolate
    await compute(_processList, [list, motos]);
  }

  void _processList(List<dynamic> args) {
    List<CollezioneMoto> list = args[0];
    List<Moto> motos = args[1];

    final motoMap = {
      for (Moto moto in motos)
        '${moto.marcaMoto}-${moto.tipoMoto}-${moto.nome.toLowerCase()}': moto
    };

    for ((int, CollezioneMoto) element in list.indexed) {
      int index = element.$1;
      CollezioneMoto collezioneMoto = element.$2;
      final key =
          '${collezioneMoto.marcaMoto}-${collezioneMoto.tipoMoto}-${collezioneMoto.modello.toLowerCase()}';
      if (motoMap.containsKey(key)) {
        list[index] = collezioneMoto.copyWith(moto: motoMap[key]);
      }
    }
  }
}
