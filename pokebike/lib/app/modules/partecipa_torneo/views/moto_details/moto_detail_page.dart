import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/data/models/moto/moto.dart';
import 'package:moto_hunters/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:moto_hunters/app/modules/partecipa_torneo/views/moto_details/moto_detail_body.dart';
import 'package:moto_hunters/app/modules/partecipa_torneo/views/moto_details/moto_detail_chosen.dart';
import 'package:moto_hunters/app/shared/widgets/image_gallery.dart';
import 'package:moto_hunters/app/shared/widgets/photo_detail.dart';
import 'package:moto_hunters/app/shared/default_page.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/widgets/utils/mimage_network.dart';

class MotoDetailPage extends GetView<PartecipaTorneoController> {
  final int index;

  const MotoDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // final Moto moto =
    //     controller.filteredList.where((Moto p0) => p0.id == index).first;
    late Moto moto;
    try {
      moto = controller.filteredList[index];
    } on RangeError {
      Iterable<Moto> motos =
          controller.filteredList.where((Moto p0) => p0.id == index);
      if (motos.isNotEmpty) {
        moto = motos.first;
      }
    }

    return DefaultPage(
      backButton: !controller.isMotoChosen.value,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: moto.id,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Get.context!.navigator.push(
                    MaterialPageRoute(
                        builder: (context) => PhotoDetail(
                            tag: moto.id.toString(), avatar: moto.avatar)),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ImageGallery(
                      images: moto.photos,
                      height: 250,
                      aspectRatio: 16 / 9,
                      canReport: false,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => controller.isMotoChosen.value
                  ? const MotoDetailChosen()
                  : GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.velocity.pixelsPerSecond.dx > 0) {
                          createNewRoute(context, true);
                        } else {
                          createNewRoute(context, false);
                        }
                      },
                      child: MotoDetailBody(
                        moto: moto,
                        index: index,
                        totalLen: controller.filteredList.length - 1,
                        onPrevious: () => createNewRoute(context, true),
                        onNext: () => createNewRoute(context, false),
                      ),
                    ),
            )),
          ],
        ),
      ),
    );
  }

  void createNewRoute(BuildContext context, bool left) {
    if ((left && index <= 0) ||
        (!left && index >= controller.filteredList.length - 1)) {
      return;
    }

    final double delta = left ? -1 : 1;

    final builder = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MotoDetailPage(index: index + delta.toInt()),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = Offset(delta, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
    Get.context!.navigator.pushReplacement(builder);
  }
}
