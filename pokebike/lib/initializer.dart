import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';

late List<CameraDescription> cameras;

class Initializer {
  Future<void> initialize() async {
    await loadStorage();
    await loadCameras();
    await loadCertificate();
    setImageCache();
  }

  loadStorage() async {
    await GetStorage.init(Constants.settingsStorage);
    Get.updateLocale(Locale(Storage.to.currentLocale.toLowerCase()));
  }

  loadCameras() async {
    cameras = await availableCameras();
  }

  loadCertificate() async {
    ByteData data = await PlatformAssetBundle()
        .load('assets/ca/danilocatone.com_ssl_certificate.cer');
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asUint8List());
  }

  setImageCache() {
    final imageCache = PaintingBinding.instance.imageCache;
    imageCache.maximumSize = 100; // Set maximum number of images to cache
    imageCache.maximumSizeBytes =
        1 * 1024 * 1024 * 1024; // Set maximum size in bytes (e.g., 100MB)
  }
}
