import 'dart:io';

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';

void handleApiResponse(BuildContext context, ApiResponse response,
    {String? successMessage,
    String? errorMessage,
    Function(dynamic)? onSuccess,
    Function(dynamic)? onError}) {
  if (response.success) {
    onSuccess?.call(response.data);
    if (successMessage != null && successMessage.isNotEmpty) {
      Get.context!.createSnackbar(successMessage);
    }
  } else {
    if (onError != null) {
      onError(response.data);
      if (errorMessage != null && errorMessage.isNotEmpty) {
        Get.context!.createSnackbar(errorMessage);
      }
    } else {
      String messageToShow = errorMessage ??
          (response.data is String && (response.data as String).isNotEmpty
              ? response.data as String
              : response.message);
      Get.context!.createSnackbar(messageToShow);
      // Get.context!.scaffold.showSnackBar(SnackBar(
      //   content: Text(response.message),
      //   action: SnackBarAction(
      //     label: "Ok",
      //     onPressed: () => Get.context!.scaffold.clearSnackBars(),
      //   ),
      // ));
    }
  }
}

Future<ApiResponse> handleApiEndpoint(
    Function request, String method, String url,
    {dynamic data,
    bool auth = true,
    String contentType = 'application/json',
    dynamic Function(double)? uploadProgress}) async {
  // Combine all arguments into a Map
  final args = {
    'request':
        request, // Functions are not serializable; avoid passing directly
    'method': method,
    'url': url,
    'data': data, // Ensure data is serializable
    'apiToken': Storage.to.apiToken,
    'auth': auth,
    'contentType': contentType,
    'uploadProgress': uploadProgress
  };

  // Use compute to handle the operation
  return await handleApiEndpointIsolate(args);
}

Future<ApiResponse> handleApiEndpointIsolate(Map<String, dynamic> args) async {
  // Extract arguments from the Map
  String method = args['method'];
  if (method == 'post') {
    log('POST BODY: ${args['data']}');
  }
  dynamic data = args['data'];
  final String apiToken = args['apiToken'];
  final request = args['request'];
  final String url = args['url'];
  // Costruisci URL completo con host se necessario
  final String fullUrl =
      url.startsWith('http') ? url : '${Constants.apiBaseUrl}$url';

  final bool auth = args['auth'];
  var contentType = args['contentType'] as String;
  final dynamic Function(double)? uploadProgress = args['uploadProgress'];

  try {
    method = method.toLowerCase();
    Map<String, String>? headers =
        auth ? {"Authorization": "Bearer $apiToken"} : null;

    if (data != null && data is Map<String, dynamic>) {
      // Accomoda XFile singoli e liste: aggiunge suffisso [] ai key
      data = castXFileMultipart(data);
      if (method == 'post' || method == 'put') {
        data = FormData(data);
        // assicurati multipart
        contentType = 'multipart/form-data';
      }
    }

    final Response response = await request(
      url,
      method,
      query: method == 'get' ? data : null,
      body: ['post', 'put', 'patch'].contains(method) ? data : null,
      headers: headers,
      contentType: contentType,
      uploadProgress: uploadProgress,
    );
    if (method == 'post') {
      log('POST response: ${response.body}');
    }
    if (response.body == null) {
      log('API $method $fullUrl -headers: $headers error: status=${response.status.code}, body=${response.body}');
      return ApiResponse.error(
        status: response.status.code,
        message: "Problema di connessione",
        data: null,
      );
    }

    final Map<String, dynamic> body = response.body;

    // Log dettagliato delle risposte di errore HTTP
    final int statusCode = response.status.code!;

    if (statusCode >= 400) {
      log('API $method $fullUrl error: status=$statusCode, body=$body');
    }

    if (statusCode == 401 && body["message"] == "Unauthenticated.") {
      return ApiResponse.error(
        status: 401,
        message: "Unauthorized",
        data: null,
      );
    }

    return ApiResponse(
        status: response.status.code,
        message: body["message"],
        data: body["data"],
        success: body.containsKey("success") && body["success"]);
  } catch (e) {
    e.printError();
    e.printInfo();
    return ApiResponse.error(
      status: 500,
      message: e.toString(),
      data: null,
    );
  }
}

/// Converte XFile o liste di XFile in MultipartFile aggiungendo '[]' ai key per array
Map<String, dynamic> castXFileMultipart(Map<String, dynamic> data) {
  log('=== CAST XFILE MULTIPART ===');
  log('Input data keys: ${data.keys.toList()}');

  final Map<String, dynamic> newData = {};
  data.forEach((key, value) {
    log('Processing key: $key, value type: ${value.runtimeType}');

    if (value is XFile) {
      final file = File(value.path);
      log('Converting single XFile: ${value.name} -> key: $key');
      // Mantieni il nome key originale per file singoli
      newData[key] = MultipartFile(file,
          filename: value.name, contentType: 'application/octet-stream');
    } else if (value is Iterable && value.isNotEmpty && value.first is XFile) {
      log('Converting XFile list: ${value.length} files -> mantengo key: $key');
      final entries = (value as Iterable<XFile>).map((x) {
        final file = File(x.path);
        log('  - File: ${x.name}');
        return MapEntry(
            key, // Mantengo il nome originale 'images' per compatibilità backend
            MultipartFile(file,
                filename: x.name, contentType: 'application/octet-stream'));
      });
      newData.addEntries(entries);
    } else if (key.endsWith('[]') && value is List && value.isNotEmpty) {
      // Gestione speciale per array nel multipart: creo multiple entries con la stessa chiave
      log('Converting array to multiple multipart entries: $key with ${value.length} values');
      for (var item in value) {
        // Aggiungo ogni elemento come entry separata con la stessa chiave
        if (!newData.containsKey(key)) {
          newData[key] = <String>[];
        }
        (newData[key] as List<String>).add(item.toString());
        log('  - Added array item: $item to key $key');
      }
    } else {
      log('Keeping as-is: $key = $value');
      newData[key] = value;
    }
  });

  log('Output data keys: ${newData.keys.toList()}');
  return newData;
}
