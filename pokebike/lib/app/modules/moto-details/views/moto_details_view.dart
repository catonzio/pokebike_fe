import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/config/constants.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/collezione_moto/collezione_moto.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/modules/moto-details/moto_details_arguments.dart';

import 'package:moto_hunters/app/modules/moto-details/views/moto_details_info.dart';
import 'package:moto_hunters/app/modules/moto-details/views/moto_details_info_edit.dart';
import 'package:moto_hunters/app/modules/moto-details/views/moto_details_stato.dart';
import 'package:moto_hunters/app/modules/moto-details/views/moto_main_photo.dart';
import 'package:moto_hunters/app/modules/moto-details/views/pagination_row.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/widgets/image_gallery.dart';
import 'package:moto_hunters/app/shared/widgets/utils/micon.dart';

import '../controllers/moto_details_controller.dart';
import 'package:moto_hunters/generated/l10n.dart';

class MotoDetailsView extends StatelessWidget {
  const MotoDetailsView({super.key});

  Future<void> initState(GetXState<MotoDetailsController> state) async {
    // state.controller?.setUser(argumentUser);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      MotoDetailsArguments? argumentUser =
          Get.arguments as MotoDetailsArguments?;
      // Make sure this is called after the widget is fully built
      state.controller?.initialize(argumentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<MotoDetailsController>(
      initState: initState,
      builder: (controller) {
        return _buildPage(controller, context);
      },
    );
  }

  DefaultPage _buildPage(
      MotoDetailsController controller, BuildContext context) {
    final moto = (controller.collezioneMoto?.moto == null
        ? controller.moto != null
            ? controller.moto!
            : Moto.fake(0)
        : controller.collezioneMoto!.moto!);
    return DefaultPage(
        backButton: true,
        backgroundColor: Colors.black,
        bottomAppbarActions: controller.isOwnMoto.value
            ? [
                Obx(() => AnimatedOpacity(
                      duration: 300.ms,
                      opacity: controller.isShowingInfo.value ? 1 : 0,
                      child: MIcon(
                        name:
                            "Edit icon ${controller.isEditingMoto.value ? 'red' : 'white'}",
                        onTap: controller.toggleEditingMoto,
                      ),
                    )),
                if (controller.canSetFavourite.value)
                  Obx(() => IconButton(
                        onPressed: () => _setFavorita(context, controller),
                        icon: const Icon(Icons.favorite),
                        color: (controller.isFavorita.value)
                            ? MColors.secondary
                            : Colors.white,
                      )),
              ]
            : null,
        body: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 1.2,
                  colors: [
                MColors.secondary.withValues(alpha: 0.05),
                Colors.black
              ])),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: Get.context!.height * 0.25,
                backgroundColor: Colors.black,
                snap: false,
                pinned: false,
                floating: true,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: ImageGallery(
                    images: moto.photos,
                    canReport: !controller.isOwnMoto.value,
                  ),
                ),
              ),
              controller.moto != null
                  ? SliverPadding(
                      padding: EdgeInsets.only(
                          bottom: Get.context!.keyboardHeight == 0
                              ? Constants.bottomNavbarHeight
                              : Get.context!.keyboardHeight),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Center(
                              child: Text(
                                controller.moto!.nome,
                                style: Get.context!.textTheme.displaySmall,
                              ),
                            ),
                            const PaginationRow(),
                            Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: controller.isShowingInfo.value
                                      ? controller.isEditingMoto.value
                                          ? const MotoDetailsInfoEdit()
                                          : MotoDetailsInfo(
                                              moto: controller.moto!)
                                      : MotoDetailsStato(
                                          moto: controller.moto!),
                                ))
                          ],
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverToBoxAdapter(
                        child: CollezioneMotoDetailsInfo(
                            collezioneMoto: controller.collezioneMoto!),
                      ),
                    )
            ],
          ),
        ));
  }

  _setFavorita(BuildContext context, MotoDetailsController controller) async {
    final ApiResponse response = await controller.setFavorita();
    if (Get.context!.mounted) {
      handleApiResponse(context, response,
          successMessage: S.of(context).favouriteMotoSaved);
    }
  }
}
