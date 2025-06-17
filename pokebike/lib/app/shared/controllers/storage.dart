import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moto_hunters/app/config/constants.dart';

class Storage {
  static Storage to = Get.find<Storage>();

  static GetStorage _box() => GetStorage(Constants.settingsStorage);

  final ReadWriteValue<String> _apiToken = ''.val('apiToken', getBox: _box);
  String get apiToken => _apiToken.val;
  set apiToken(String value) => _apiToken.val = value;

  final ReadWriteValue<bool> _hasSeenPresentation =
      false.val('seenPresentation', getBox: _box);
  bool get hasSeenPresentation => _hasSeenPresentation.val;
  set hasSeenPresentation(bool value) => _hasSeenPresentation.val = value;

  // flag per mostrare info introduttive (solo una volta)
  final ReadWriteValue<bool> _hasSeenGarageInfo =
      false.val('seenGarageInfo', getBox: _box);
  bool get hasSeenGarageInfo => _hasSeenGarageInfo.val;
  set hasSeenGarageInfo(bool value) => _hasSeenGarageInfo.val = value;

  final ReadWriteValue<bool> _hasSeenCollectionInfo =
      false.val('seenCollectionInfo', getBox: _box);
  bool get hasSeenCollectionInfo => _hasSeenCollectionInfo.val;
  set hasSeenCollectionInfo(bool value) => _hasSeenCollectionInfo.val = value;

  final ReadWriteValue<bool> _hasSeenMedaglieInfo =
      false.val('seenMedaglieInfo', getBox: _box);
  bool get hasSeenMedaglieInfo => _hasSeenMedaglieInfo.val;
  set hasSeenMedaglieInfo(bool value) => _hasSeenMedaglieInfo.val = value;

  // flag per mostrare info introduttive del Tournament (solo una volta)
  final ReadWriteValue<bool> _hasSeenTournamentInfo =
      false.val('seenTournamentInfo', getBox: _box);
  bool get hasSeenTournamentInfo => _hasSeenTournamentInfo.val;
  set hasSeenTournamentInfo(bool value) => _hasSeenTournamentInfo.val = value;

  final ReadWriteValue<String> _currentLocale =
      (Get.deviceLocale?.countryCode?.toLowerCase() ?? 'en')
          .val('currentLocale', getBox: _box);
  String get currentLocale => _currentLocale.val;
  set currentLocale(String value) => _currentLocale.val = value;
}
