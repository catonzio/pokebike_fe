import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/shared/controllers/searchable_moto_controller.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';

class CollezioneController extends SearchableMotoController {
  final MotoProvider provider;

  CollezioneController({required this.provider})
      : super(fetchFunction: () async {
          return List.generate(
              100, (index) => ((index) % 3 == 0) ? Moto.fake(index) : null);
        });
}
