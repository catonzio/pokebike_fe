import 'package:get/get.dart';
import 'package:moto_hunters/app/data/enums/order_by.dart';
import 'package:moto_hunters/generated/l10n.dart';

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
    return {
      S.of(Get.context!).orderBy: orderBy.name,
      S.of(Get.context!).type: tipo,
      S.of(Get.context!).brand: marca
    }.toString();
  }
}
