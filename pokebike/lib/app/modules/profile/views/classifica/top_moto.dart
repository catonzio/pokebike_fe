import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/modules/moto-details/moto_details_arguments.dart';
import 'package:moto_hunters/app/modules/profile/controllers/profile_controller.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopMoto extends StatelessWidget {
  const TopMoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
      initState: (state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.controller?.fetchTopMotos();
        });
      },
      builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('topMoto'.tr.toUpperCase(),
                  style: context.textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Skeletonizer(
              enabled: controller.isFetchingTopMotos.value,
              child: Row(
                // itemExtent: context.width * 0.3,
                // scrollDirection: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: (controller.topMotos.isEmpty
                        ? controller.fakeMotos
                        : controller.topMotos)
                    .map((e) => Container(
                          width: context.width * 0.28,
                          height: context.height * 0.11,
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              context.pushNamed(Routes.MOTO_DETAILS,
                                  arguments: MotoDetailsArguments(
                                      moto: e,
                                      isOwnMoto:
                                          controller.isOwnProfile.value));
                            },
                            child: MimageNetwork(
                              path: e.avatar,
                              borderRadius: BorderRadius.circular(8),
                              cacheHeight: 300,
                              cacheWidth: 300,
                            ),
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
