import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/modules/fotocamera/views/add_moto_form.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';

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
    return DefaultPage(
      useAppbar: false,
      body: Column(
        children: [
          _showImage(context),
          Container(
              height: context.height * 0.6,
              width: context.width,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment.bottomCenter,
                      radius: 1.2,
                      colors: [
                    MColors.secondary.withOpacity(0.3),
                    Colors.black
                  ])),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Informazioni"),
                  )),
                  Expanded(
                      child: AddMotoForm(
                    onSend: (data) => _addMoto(context, data),
                  )),
                ],
              )),
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context) {
    return Container(
      height: context.height * 0.4,
      width: context.width,
      color: Colors.grey,
      child: FutureBuilder(
        future: xFileToImage(controller.image!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image(image: (snapshot.data as Image).image);
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
    // showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //         title: const Text("Caricamento..."),
    //         content: Text(data.toString())));
    data["image"] = controller.image;
    ApiResponse response = await controller.addMoto(data);
    if (context.mounted) {
      handleApiResponse(context, response, (dynamic data) {
        print(data);
      });
    }
  }
}
