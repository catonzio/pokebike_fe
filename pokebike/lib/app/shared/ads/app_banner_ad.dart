import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moto_hunters/app/shared/ads/ad_service.dart';

/// BannerAd Widget riutilizzabile.
/// Usage: AppBannerAd() in qualsiasi punto della UI.
class AppBannerAd extends StatefulWidget {
  const AppBannerAd({super.key});

  @override
  State<AppBannerAd> createState() => _AppBannerAdState();
}

class _AppBannerAdState extends State<AppBannerAd> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  void _loadAd() {
    _bannerAd ??= BannerAd(
      size: AdSize.banner,
      adUnitId: AdService.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (ad, error) {
          log('Banner ad failed to load: $error', name: 'AppBannerAd');
          ad.dispose();
          // Non logghiamo errori troppo rumorosi in produzione
        },
      ),
      request: const AdRequest(),
    )
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      // placeholder trasparente per evitare layout shift
      return const SizedBox(height: 0);
    }

    return SizedBox(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
