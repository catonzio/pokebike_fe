import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/shared/providers/moto_provider.dart';
import 'package:pokebike/initializer.dart';

class FotocameraController extends GetxController {
  final RxInt _selectedIndex = 1.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;

  final RxBool _isInitialized = false.obs;
  bool get isInitialized => _isInitialized.value;
  set isInitialized(bool value) => _isInitialized.value = value;

  final RxBool _isCapturing = true.obs;
  bool get isCapturing => _isCapturing.value;
  set isCapturing(bool value) => _isCapturing.value = value;

  final RxBool isUploadingMoto = false.obs;

  final ScrollController scrollController = ScrollController();

  CameraController cameraController =
      CameraController(cameras[0], ResolutionPreset.max);

  final Rx<XFile?> _image = Rx<XFile?>(null);
  XFile? get image => _image.value;
  set image(XFile? value) => _image.value = value;

  final MotoProvider provider;

  FotocameraController(this.provider);

  @override
  Future<void> onInit() async {
    // cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController
        .initialize()
        .then((value) => isInitialized = true)
        .onError((error, stackTrace) {
      print(error);
      return false;
    });
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isCapturing = true;
      } else {
        isCapturing = false;
      }
    });
    super.onInit();
  }

  makePhoto() async {
    try {
      image = await cameraController.takePicture();
    } catch (e) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        print(image.path);
        this.image = image;
        // controller.avatar = image.path;
      }
    }
    isCapturing = false;
  }

  Future<ApiResponse> addMoto(Map<String, dynamic> data) async {
    // isUploadingMoto.value = true;
    final ApiResponse result = await provider.addMoto(data);
    // isUploadingMoto.value = false;
    return result;
  }

  Future<ApiResponse> checkMotoDuplicate(Map<String, dynamic> data) async {
    final ApiResponse result = await provider.checkMotoDuplicate(
        data['marca_moto_id'], data['tipo_moto_id'], data['nome']);
    return result;
  }
}
