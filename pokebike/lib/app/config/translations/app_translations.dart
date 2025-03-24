import 'package:get/get.dart';
import 'package:moto_hunters/app/config/translations/en_usuk.dart';
import 'package:moto_hunters/app/config/translations/es_es.dart';
import 'package:moto_hunters/app/config/translations/fr_fr.dart';
import 'package:moto_hunters/app/config/translations/it_IT.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'it': itItTranslations,
        'en': enUsUkTranslations,
        'es': esEsTranslations,
        'fr': frFrTranslations
      };
}
