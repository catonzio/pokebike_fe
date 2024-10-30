import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokebike/app/config/constants.dart';

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

  final ReadWriteValue<String> _currentLocale =
      (Get.deviceLocale?.countryCode?.toLowerCase() ?? 'en')
          .val('currentLocale', getBox: _box);
  String get currentLocale => _currentLocale.val;
  set currentLocale(String value) => _currentLocale.val = value;
}
