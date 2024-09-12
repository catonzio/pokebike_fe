// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokebike/app/data/models/marca_moto/marca_moto.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/data/models/tipo_moto/tipo_moto.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'collezione_moto.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'collezione_moto.g.dart';

@freezed
class CollezioneMoto with _$CollezioneMoto {
  const factory CollezioneMoto({
    required int id,
    required MarcaMoto marcaMoto,
    required TipoMoto tipoMoto,
    required String modello,
    required String nazione,
    required int rarita,
    Moto? moto
  }) = _CollezioneMoto;

  factory CollezioneMoto.fromJson(Map<String, Object?> json) =>
      _$CollezioneMotoFromJson(json);

  factory CollezioneMoto.fake(int index) => CollezioneMoto(
      id: index,
      marcaMoto: MarcaMoto.fake(index),
      tipoMoto: TipoMoto.fake(index),
      modello: "modello_$index",
      nazione: "nazione_$index",
      rarita: 0);
}