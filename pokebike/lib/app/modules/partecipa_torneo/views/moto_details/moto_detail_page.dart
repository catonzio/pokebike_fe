import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/data/models/moto/moto.dart';
import 'package:pokebike/app/modules/partecipa_torneo/controllers/partecipa_torneo_controller.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_body.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_chosen.dart';
import 'package:pokebike/app/modules/partecipa_torneo/views/moto_details/moto_detail_photo.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/widgets/utils/mimage_network.dart';

class MotoDetailPage extends GetView<PartecipaTorneoController> {
  final int index;

  const MotoDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final Moto moto = controller.collections[index];

    return Obx(() => DefaultPage(
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
                      onTap: () => context.navigator.push(
                        MaterialPageRoute(
                            builder: (context) => MotoDetailPhoto(
                                tag: moto.id.toString(),
                                avatarUrl: moto.avatar)),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: MimageNetwork(
                          borderRadius: BorderRadius.circular(16),
                          path: moto.avatar,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Obx(
                  () => controller.isMotoChosen.value
                      ? const MotoDetailChosen()
                      : MotoDetailBody(
                          moto: moto,
                          index: index,
                          onPrevious: () => _onPrevious(context),
                          onNext: () => _onNext(context),
                        ),
                )),
              ],
            ),
          ),
        ));
  }

  void _onPrevious(BuildContext context) {
    if (index > 0) {
      context.navigator.pushReplacement(MaterialPageRoute(
          builder: (context) => MotoDetailPage(index: index - 1)));
    }
  }

  void _onNext(BuildContext context) {
    if (index < controller.collections.length - 1) {
      context.navigator.pushReplacement(MaterialPageRoute(
          builder: (context) => MotoDetailPage(index: index + 1)));
    }
  }
}
