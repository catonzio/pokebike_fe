import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moto_hunters/app/config/constants.dart';

/// Gestisce configurazione e utility per AdMob.
/// Sostituire gli adUnitId di produzione con quelli reali quando disponibili.
class AdService {
  // App IDs (utilizzati solo nei file di configurazione native)
  static const _androidAppId = 'ca-app-pub-9794798397206358~2596643054';
  static const _iosAppId = 'ca-app-pub-9794798397206358~8919809567';

  // Banner Unit IDs di TEST forniti da Google
  static const _androidBannerTestId = 'ca-app-pub-3940256099942544/6300978111';
  static const _iosBannerTestId = 'ca-app-pub-3940256099942544/2934735716';

  // Banner Unit IDs di PRODUZIONE – sostituire con quelli reali!
  static const _androidBannerProdId = 'ca-app-pub-9794798397206358/9840163084';
  static const _iosBannerProdId = 'ca-app-pub-9794798397206358/6056830748';

  /// Restituisce l'adUnitId corretto per il banner.
  static String get bannerAdUnitId {
    // In modalità debug o ambiente locale usiamo gli ID di test ufficiali
    //if (kDebugMode || Constants.isLocal) {
    //  return Platform.isAndroid ? _androidBannerTestId : _iosBannerTestId;
    //}
    // In produzione restituiamo gli ID reali
    return Platform.isAndroid ? _androidBannerProdId : _iosBannerProdId;
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
    final buffer = StringBuffer();
    status.adapterStatuses.forEach((adapter, adapterStatus) {
      buffer.writeln('$adapter → ${adapterStatus.state} (${adapterStatus.description})');
    });
    log('AdMob initialized:\n$buffer', name: 'AdService');
    return status;
  }
}
