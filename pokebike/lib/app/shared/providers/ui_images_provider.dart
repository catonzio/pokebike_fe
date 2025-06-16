import 'dart:developer';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';

class UIImagesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }

  /// Recupera tutte le UI images, facoltativamente filtrando per key
  Future<List<ApiMedia>> fetchUIImages({String? key}) async {
    final query = key != null ? '?key=$key' : '';
    log('[UI IMAGES PROVIDER] fetching images at ${Constants.apiBaseUrl}/ui-images$query');
    final response = await handleApiEndpoint(
        request, 'get', '${Constants.apiBaseUrl}/ui-images$query');
    if (response.success && response.data is List) {
      return (response.data as List)
          .map((e) => ApiMedia.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
