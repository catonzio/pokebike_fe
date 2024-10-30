import 'package:get/get.dart';
import 'package:pokebike/app/data/models/marca_moto/marca_moto.dart';
import 'package:pokebike/app/data/models/tipo_moto/tipo_moto.dart';
import 'package:pokebike/app/shared/providers/tipo_marca_provider.dart';

class TipoMarcaController extends GetxController {
  static TipoMarcaController get to => Get.find<TipoMarcaController>();
  final TipoMarcaProvider provider;

  final List<MarcaMoto> marche = [];
  final List<TipoMoto> tipi = [];
  final List<String> modelli = [];

  TipoMarcaController({required this.provider});

  List<String> get nomiTipi => tipi.map((e) => e.nome).toList();
  List<String> get nomiMarche => marche.map((e) => e.nome).toList();

  Future<void> initialize() async {
    await Future.wait([
      fetchMarche(),
      fetchTipi(),
      fetchModelli(),
    ]);

    // print(
    //     "Marche len: ${marche.length}, Tipi len: ${tipi.length} Modelli len: ${modelli.length}");
  }

  Future<void> fetchMarche() async {
    List<MarcaMoto> marche = await provider.fetchMarcas();
    this.marche.addAll(marche);
  }

  Future<void> fetchTipi() async {
    List<TipoMoto> tipi = await provider.fetchTipos();
    this.tipi.addAll(tipi);
  }

  Future<void> fetchModelli() async {
    List<String> modelli = await provider.fetchModelli();
    this.modelli.addAll(modelli);
  }
}
