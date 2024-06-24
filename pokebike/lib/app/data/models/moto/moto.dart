// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokebike/app/data/models/marca_moto/marca_moto.dart';
import 'package:pokebike/app/data/models/tipo_moto/tipo_moto.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'moto.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'moto.g.dart';

@freezed
class Moto with _$Moto {
  const factory Moto({
    required String nome,
    required String descrizione,
    required int anno,
    required String luogo,
    required DateTime dataCattura,
    required MarcaMoto marcaMoto,
    required TipoMoto tipoMoto,
    required int numVittorie,
    required int numSconfitte,
    required String avatar,
  }) = _Moto;

  factory Moto.fromJson(Map<String, Object?> json) => _$MotoFromJson(json);
}
