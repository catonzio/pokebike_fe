import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokebike/app/config/constants.dart';

class Storage {
  static Storage to = Get.find<Storage>();

  static GetStorage _box() => GetStorage(Constants.settingsStorage);

  final ReadWriteValue<String> _apiToken = ''.val('apiToken', getBox: _box);
  String get apiToken => _apiToken.val;
  set apiToken(String value) => _apiToken.val = value;
}
