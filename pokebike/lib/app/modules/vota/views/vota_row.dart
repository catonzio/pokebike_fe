import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/partecipazione/partecipazione.dart';
import 'package:moto_hunters/app/modules/vota/controllers/vota_controller.dart';
import 'package:moto_hunters/app/modules/vota/views/vota_moto_image.dart';
import 'package:moto_hunters/app/modules/vota/views/vota_player_row.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/widgets/photo_action_menu.dart';
import 'package:moto_hunters/app/shared/widgets/image_gallery.dart';
import 'package:moto_hunters/app/shared/widgets/photo_report_menu.dart';
import 'package:moto_hunters/generated/l10n.dart';

class VotaRow extends GetView<VotaController> {
  final Partecipazione partecipazione;
  final bool reversed;

  const VotaRow(
      {super.key, required this.partecipazione, this.reversed = false});

  @override
  Widget build(BuildContext context) {
    final double totalHeight = Get.context!.height * 0.285;
    final double playerRowHeight = totalHeight * 0.15;
    final double motoImageHeight = totalHeight * 0.7;

    final VotaPlayerRow playerRow = VotaPlayerRow(
      height: playerRowHeight,
      playerName: partecipazione.fullName,
      playerAvatar: partecipazione.avatar,
      reversed: reversed,
    );

    // Decide se usare la gallery o l'immagine singola
    final bool useGallery = partecipazione.motoPhotos.isNotEmpty;
    final Widget motoImageWidget = useGallery
        ? Container(
            height: motoImageHeight,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: (reversed
                            ? MColors.votaSecondPlayerColor
                            : MColors.votaFirstPlayerColor)
                        .withValues(alpha: 0.4),
                    blurRadius: 64,
                    spreadRadius: 8,
                    offset: Offset.zero,
                    blurStyle: BlurStyle.normal),
              ],
            ),
            child: ImageGallery(
              images: partecipazione.motoPhotos,
              height: motoImageHeight,
              aspectRatio: 4 / 3,
            ),
          )
        : VotaMotoImage(
            height: motoImageHeight,
            motoAvatar: partecipazione.motoAvatar,
            reversed: reversed,
          );

    return SizedBox(
        height: totalHeight,
        child: Column(
          children: [
            if (reversed) playerRow,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {},
                    onDoubleTap: () async {
                      ApiResponse response =
                          await controller.vota(partecipazione.id);
                      if (Get.context!.mounted) {
                        handleApiResponse(context, response,
                            successMessage: S.of(context).pointGained);
                      }
                    },
                    child: motoImageWidget,
                  ),
                  // Mostra il menu solo se ci sono immagini disponibili
                  if ((useGallery && partecipazione.motoPhotos.isNotEmpty) ||
                      (!useGallery && partecipazione.motoAvatar != null))
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: PhotoActionMenu(
                        media: useGallery
                            ? partecipazione.motoPhotos.first
                            : partecipazione.motoAvatar!,
                        onLike: () async {
                          ApiResponse response =
                              await controller.vota(partecipazione.id);
                          if (Get.context!.mounted) {
                            handleApiResponse(context, response,
                                successMessage: S.of(context).pointGained);
                          }
                          Navigator.pop(context);
                        },
                        onReport: () => PhotoReportMenu.onReport(
                            context,
                            useGallery
                                ? partecipazione.motoPhotos.first
                                : partecipazione.motoAvatar!),
                      ),
                    ),
                ],
              ),
            ),
            if (!reversed) playerRow,
          ],
        ));
  }
}
