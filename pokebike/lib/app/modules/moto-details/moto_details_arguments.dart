import 'package:pokebike/app/data/models/moto/moto.dart';

class MotoDetailsArguments {
  final Moto moto;
  final bool isOwnMoto;

  const MotoDetailsArguments({required this.moto, required this.isOwnMoto});
}
