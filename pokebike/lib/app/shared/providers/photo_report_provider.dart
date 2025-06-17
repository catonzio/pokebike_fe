import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'dart:developer';

/// Eccezione per segnalazioni duplicate HTTP 409
class DuplicateReportException implements Exception {}

/// NUOVO UPDATE MATTEO
class PhotoReportProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }

  /// Invia segnalazione con retry esponenziale (max 3)
  Future<ApiResponse> report({
    required int mediaId,
    String? mediaUrl,
    String? reason,
  }) async {
    final data = <String, dynamic>{};
    if (mediaId != null) {
      data['media_id'] = mediaId;
    } else if (mediaUrl != null && mediaUrl.isNotEmpty) {
      data['media_url'] = mediaUrl;
    } else {
      throw ArgumentError('mediaId or mediaUrl must be provided');
    }
    if (reason != null && reason.isNotEmpty) {
      data['reason'] = reason;
    }
    log('BODY IS $data');
    final ApiResponse response = await handleApiEndpoint(
      request,
      'post',
      '/reports',
      data: data,
    );
    // Log della risposta API per debug
    log('PhotoReport API response: status=${response.status}, success=${response.success}, message=${response.message}, data=${response.data}');
    if (response.status == 409) throw DuplicateReportException();
    if (response.status == 404) {
      throw Exception(response.message ?? 'Media non trovato per URL');
    }
    if (!response.success) {
      throw Exception(response.message ?? 'Errore invio segnalazione');
    }
    return response;
  }
}
