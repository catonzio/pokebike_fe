import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:get/get.dart';

class MotoDetailsArguments {
  final CollezioneMoto? collezioneMoto;
  final Moto? moto;
  final bool isOwnMoto;
  final bool canSetFavourite;
  final int? collectionIndex;

  const MotoDetailsArguments(
      {this.moto,
      this.collezioneMoto,
      this.collectionIndex,
      this.isOwnMoto = false,
      this.canSetFavourite = false});
}
