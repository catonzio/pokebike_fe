// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:get/get.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'classifica_tile.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'classifica_tile.g.dart';

@freezed
class ClassificaTile with _$ClassificaTile {
  const factory ClassificaTile(
      {required int id,
      required int userId,
      required int puntiTotali,
      required int position,
      required User user}) = _ClassificaTile;

  factory ClassificaTile.fromJson(Map<String, Object?> json) =>
      _$ClassificaTileFromJson(json);

  factory ClassificaTile.fake(int index) => ClassificaTile(
      id: index,
      userId: index,
      puntiTotali: 10,
      position: 2,
      user: User.fake(index));

  // factory ClassificaTile.fake(int index) => ClassificaTile(
  //     id: index,
  //     marcaMoto: MarcaMoto.fake(index),
  //     tipoMoto: TipoMoto.fake(index),
  //     modello: "modello_$index",
  //     nazione: "nazione_$index",
  //     rarita: 0);
}
