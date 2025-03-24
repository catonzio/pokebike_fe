import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_hunters/app/shared/controllers/searchable_moto_controller.dart';
import 'package:moto_hunters/app/shared/providers/moto_provider.dart';

class GarageWController extends SearchableMotoController {
  static GarageWController get to => Get.find<GarageWController>();

  final MotoProvider provider;

  GarageWController({required this.provider})
      : super(
            fetchFunction: (l, s) =>
                provider.fetchMotos(limit: l, skip: s, isGarage: true));

  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    skip = 0;
    super.onInit();
  }
}
