import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';
import 'package:pokebike/app/shared/widgets/utils/loading_stack.dart';

import '../controllers/fotocamera_controller.dart';

Future<Image> xFileToImage(XFile xFile) async {
  final Uint8List bytes = await xFile.readAsBytes();
  return Image.memory(bytes);
}

class AddMotoView extends GetView<FotocameraController> {
  const AddMotoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingStack(
        isLoading: controller.isUploadingMoto,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              expandedHeight: context.height * 0.4,
              snap: false,
              pinned: false,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(background: _showImage(context)),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: context.keyboardHeight / 1.5),
              sliver: SliverFillRemaining(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          center: Alignment.bottomCenter,
                          radius: 1.2,
                          colors: [
                        MColors.secondary.withOpacity(0.3),
                        Colors.black
                      ])),
                  child: AddMotoForm(
                    onStartEndSend: (bool value) =>
                        controller.isUploadingMoto.value = value,
                    onSend: (data) => _addMoto(context, data),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _showImage(BuildContext context) {
    return Container(
      height: context.height * 0.4,
      width: context.width,
      color: MColors.primaryDark,
      child: FutureBuilder(
        future: xFileToImage(controller.image!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image(
                image: (snapshot.data as Image).image, fit: BoxFit.cover);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  _addMoto(BuildContext context, Map<String, dynamic> data) async {
    data["image"] = controller.image;
    ApiResponse response = await controller.addMoto(data);
    if (context.mounted) {
      handleApiResponse(context, response,
          successMessage: "Moto salvata correttamente",
          onSuccess: (dynamic data) {
        controller.isCapturing = true;
      });
    }
  }
}
