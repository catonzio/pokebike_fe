import 'package:flutter/material.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/data/models/notifica/notifica.dart';
import 'package:moto_hunters/app/modules/notifications/providers/notifica_provider.dart';
import 'package:moto_hunters/app/shared/controllers/api_pagination_controller.dart';
import 'package:get/get.dart';

class NotificationsController extends ApiPaginationController<Notifica> {
  final NotificaProvider provider;
  final List<Notifica> fakeList =
      List.generate(3, (index) => Notifica.fake(index));

  NotificationsController({required this.provider})
      : super(providerFunc: provider.fetchNotifiche);

  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    skip = 0;
    super.onInit();
  }

  Notifica? getN(String id) => list.where((el) => el.id == id).firstOrNull;

  deleteAll() async {
    ApiResponse response = await provider.deleteAll();
    if (response.success) {
      list.clear();
    }
  }

  delete(String id) async {
    ApiResponse response = await provider.deleteNotifica(id);
    if (response.success) {
      list.removeWhere((notifica) => notifica.id == id);
    }
  }

  updateNotifica(Notifica notifica, int index, {bool refresh = false}) {
    list[index] = notifica.copyWith(
        hasSeen: true, readAt: notifica.readAt ?? DateTime.now());
    if (refresh) {
      list.refresh();
    }
  }

  tap(String id) {
    Notifica? notifica = getN(id);
    if (notifica != null) {
      int index = list.indexOf(notifica);
      updateNotifica(notifica, index, refresh: true);
      provider.readNotifica(notifica.id);
    }
  }

  readAll() {
    if (list.isEmpty) {
      return;
    }
    for ((int, Notifica) element in list.indexed) {
      int index = element.$1;
      Notifica notifica = element.$2;
      updateNotifica(notifica, index);
    }
    list.refresh();
    provider.readAll();
  }
}
