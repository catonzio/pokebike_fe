import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/moto-details/moto_details_arguments.dart';
import 'package:moto_hunters/app/modules/profile/controllers/profile_controller.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';
import 'package:moto_hunters/app/shared/widgets/photo_report_menu.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moto_hunters/generated/l10n.dart';

class TopMoto extends StatelessWidget {
  const TopMoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
      builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(S.of(context).topMoto.toUpperCase(),
                  style: Get.context!.textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Skeletonizer(
              enabled: controller.isFetchingTopMotos.value,
              child: Row(
                // itemExtent: Get.context!.width * 0.3,
                // scrollDirection: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: (controller.isFetchingTopMotos.value
                        ? controller.fakeMotos
                        : controller.topMotos)
                    .map((e) => SizedBox(
                          width: Get.context!.width * 0.28,
                          height: Get.context!.height * 0.11,
                          child: Stack(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  Get.context!.pushNamed(Routes.MOTO_DETAILS,
                                      arguments: MotoDetailsArguments(
                                          moto: e,
                                          isOwnMoto:
                                              controller.isOwnProfile.value));
                                },
                                child: MimageNetwork(
                                  path: e.avatar?.url ?? '',
                                  borderRadius: BorderRadius.circular(8),
                                  cacheHeight: 300,
                                  cacheWidth: 300,
                                ),
                              ),
                              if (e.avatar != null)
                                Positioned(
                                  bottom: 0,
                                  right: -8,
                                  child: PhotoReportMenu(
                                    //photoId: e.id,
                                    media: e.avatar!,
                                  ),
                                ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        );
      },
    );
  }
}
