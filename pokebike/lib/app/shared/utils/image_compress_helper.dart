import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// Utility per comprimere un [XFile] immagine prima dell'upload.
///
/// [quality] da 0 a 100 (default 80) indica il livello di qualità JPEG.
/// [maxWidth]/[maxHeight] permettono di ridimensionare mantenendo proporzioni.
/// Restituisce l'[XFile] compresso; se la compressione fallisce ritorna l'originale.
Future<XFile> compressImage(
  XFile original, {
  int quality = 80,
  int maxWidth = 1280,
  int maxHeight = 1280,
}) async {
  try {
    // Percorso file temporaneo dove salvare l'immagine compressa
    final Directory dir = await getTemporaryDirectory();
    final String targetPath =
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_${original.name}';

    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      original.path,
      targetPath,
      quality: quality,
      minWidth: maxWidth,
      minHeight: maxHeight,
      keepExif: true,
    );

    if (result != null) {
      return result;
    }
  } catch (_) {
    // Ignora e torna originale se qualcosa va storto.
  }
  return original;
}
