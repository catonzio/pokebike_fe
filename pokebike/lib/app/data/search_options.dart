import 'package:pokebike/app/data/enums/order_by.dart';

class SearchOptions {
  final OrderBy orderBy;
  final List<String> tipo;
  final List<String> marca;

  const SearchOptions(
      {OrderBy? orderBy, List<String>? tipo, List<String>? marca})
      : orderBy = orderBy ?? OrderBy.none,
        tipo = tipo ?? const [],
        marca = marca ?? const [];

  @override
  String toString() {
    return {"Ordina per": orderBy.name, "Tipo": tipo, "Marca": marca}
        .toString();
  }
}
