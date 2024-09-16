import 'package:flutter/material.dart';
import 'package:pokebike/app/data/models/notifica/notifica.dart';
import 'package:pokebike/app/modules/notifications/providers/notifica_provider.dart';
import 'package:pokebike/app/shared/controllers/api_pagination_controller.dart';

class NotificationsController extends ApiPaginationController<Notifica> {
  final NotificaProvider provider;
  final List<Notifica> fakeList =
      List.generate(3, (index) => Notifica.fake(index));

  NotificationsController({required this.provider})
      : super(providerFunc: provider.fetchNotifiche);

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }

  Notifica? getN(int id) => list.where((el) => el.id == id).firstOrNull;

  deleteAll() {
    list.clear();
  }

  delete(int id) {
    list.removeWhere((notifica) => notifica.id == id);
  }

  updateNotifica(Notifica notifica, int index, {bool refresh = false}) {
    list[index] = notifica.copyWith(
        hasSeen: true, seenAt: notifica.seenAt ?? DateTime.now());
    if (refresh) {
      list.refresh();
    }
  }

  tap(int id) {
    Notifica? notifica = getN(id);
    if (notifica != null) {
      int index = list.indexOf(notifica);
      updateNotifica(notifica, index, refresh: true);
      provider.readNotifica(notifica.id);
    }
  }

  readAll() {
    for ((int, Notifica) element in list.indexed) {
      int index = element.$1;
      Notifica notifica = element.$2;
      updateNotifica(notifica, index);
    }
    list.refresh();
    provider.readAll();
  }
}
