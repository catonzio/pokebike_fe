import 'package:pokebike/app/shared/controllers/searchable_moto_controller.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

class GarageWController extends SearchableMotoController {
  final MotoProvider provider;

  GarageWController({required this.provider})
      : super(fetchFunction: provider.fetchMotos);
}
