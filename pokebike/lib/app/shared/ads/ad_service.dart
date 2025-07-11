import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moto_hunters/app/config/constants.dart';

/// Gestisce configurazione e utility per AdMob.
/// Sostituire gli adUnitId di produzione con quelli reali quando disponibili.
class AdService {
  static const _androidBannerTestId = 'ca-app-pub-3940256099942544/6300978111';
  static const _iosBannerTestId = 'ca-app-pub-3940256099942544/2934735716';

  /// Restituisce l'adUnitId corretto per il banner.
  static String get bannerAdUnitId {
    // In modalità local/development usa i test ID ufficiali di Google.
    if (kDebugMode) {
      return Platform.isAndroid ? _androidBannerTestId : _iosBannerTestId;
    }
    // TODO: Inserire qui gli ID di produzione rilasciati da AdMob.
    if (Platform.isAndroid) {
      return 'ca-app-pub-9794798397206358~2596643054';
    }
    if (Platform.isIOS) {
      return 'ca-app-pub-9794798397206358~8919809567';
    }
    throw UnsupportedError('Unsupported platform for AdMob');
  }

  /// Chiamato all'avvio dell'app -> vedi main.dart
  static Future<InitializationStatus> initialize(
      {List<String>? testDeviceIds}) async {
    final status = await MobileAds.instance.initialize();
    if (testDeviceIds != null && testDeviceIds.isNotEmpty) {
      await MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: testDeviceIds),
      );
    }
    return status;
  }
}
