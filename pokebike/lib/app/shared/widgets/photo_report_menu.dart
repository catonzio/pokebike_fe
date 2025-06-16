/// NUOVO UPDATE MATTEO
/// Popup menu per invio segnalazione foto
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';
import 'package:moto_hunters/app/shared/providers/photo_report_provider.dart';
import 'package:moto_hunters/generated/l10n.dart';
import 'dart:developer';

/// NUOVO UPDATE MATTEO
class PhotoReportMenu extends StatelessWidget {
  //final int photoId;
  final ApiMedia media;

  const PhotoReportMenu({
    Key? key,
    /* required this.photoId, */
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (media.id == -1) return const SizedBox.shrink();
    //if (mediaUrl.contains('storage/default')) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            center: Alignment.center,
            colors: [
              Colors.black.withAlpha(200),
              Colors.transparent,
            ],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(20),
      ),
      child: PopupMenuButton<int>(
        icon: const Icon(Icons.more_vert, semanticLabel: 'Opzioni foto'),
        tooltip: 'Opzioni foto',
        onSelected: (id) async {},
        itemBuilder: (_) => [
          PopupMenuItem(
            //value: photoId,
            child: ListTile(
              onTap: () => onReport(context, media),
              leading: const Icon(Icons.flag_outlined),
              title: const Text('Segnala'),
            ),
          ),
        ],
      ),
    );
  }

  static onReport(BuildContext context, ApiMedia media) async {
    final provider = Get.put(PhotoReportProvider());
    // Conferma segnalazione e chiedi motivo in un unico dialog
    final reasonController = TextEditingController();
    String? customReason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).reportConfirmation),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: S.of(context).reportReason,
                hintText: S.of(context).enterReasonOptional,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(reasonController.text),
            child: Text(S.of(context).confirm),
          ),
        ],
      ),
    );
    if (customReason == null) return;
    final reason = customReason.isNotEmpty ? customReason : '';
    log('Reporting photo URL: $media, reason: $reason');
    try {
      await provider.report(mediaId: media.id, reason: reason);
      Get.snackbar('', S.of(context).reportFeedback,
          snackPosition: SnackPosition.BOTTOM);
    } on DuplicateReportException {
      Get.snackbar('Attenzione', 'Hai già segnalato questa foto',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('', S.of(context).reportError,
          snackPosition: SnackPosition.BOTTOM);
      log('Error reporting photo: $e');
    }
  }
}
