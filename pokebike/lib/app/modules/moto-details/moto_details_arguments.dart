import 'package:pokebike/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';

class MotoDetailsArguments {
  final CollezioneMoto? collezioneMoto;
  final Moto? moto;
  final bool isOwnMoto;
  final bool canSetFavourite;

  const MotoDetailsArguments(
      {this.moto, this.collezioneMoto, this.isOwnMoto = false, this.canSetFavourite = false});
}
