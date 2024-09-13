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
            orderByFilterFunc: (List<CollezioneMoto> els, OrderBy orderBy) =>
                els, providerFunc: provider.fetchCollezioneMoto);

  Future<void> fetch() async {
    await initialFetch();
    final GarageWController controller = GarageWController.to;
    final List<Moto> motos = controller.list;
    for ((int, CollezioneMoto) collezioneMoto in list.indexed) {
      for (Moto moto in motos) {
        if (collezioneMoto.$2.marcaMoto == moto.marcaMoto &&
            collezioneMoto.$2.tipoMoto == moto.tipoMoto &&
            collezioneMoto.$2.modello.toLowerCase() ==
                moto.nome.toLowerCase()) {
          list[collezioneMoto.$1] = collezioneMoto.$2.copyWith(moto: moto);
          break;
        }
      }
    }
  }

  Future<void> refreshList() async {
    list.clear();
    filteredList.clear();
    initialFetch();
  }
}
