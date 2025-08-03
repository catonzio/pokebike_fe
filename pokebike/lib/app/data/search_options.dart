import 'package:get/get.dart';
import 'package:moto_hunters/app/data/enums/order_by.dart';
import 'package:moto_hunters/generated/l10n.dart';

class SearchOptions {
  final OrderBy orderBy;
  final List<String> tipo;
  final List<String> marca;
  final bool possedute;

  const SearchOptions(
      {OrderBy? orderBy, List<String>? tipo, List<String>? marca, bool? possedute})
      : orderBy = orderBy ?? OrderBy.none,
        tipo = tipo ?? const [],
        marca = marca ?? const [],
        possedute = possedute ?? false;

  @override
  String toString() {
    return {
      S.of(Get.context!).orderBy: orderBy.name,
      S.of(Get.context!).type: tipo,
      S.of(Get.context!).brand: marca,
      "Possedute": possedute
    }.toString();
  }
}
