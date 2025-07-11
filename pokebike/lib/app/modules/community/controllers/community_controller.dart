import 'package:flutter/material.dart';
import 'package:moto_hunters/app/data/enums/order_by.dart';
import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:moto_hunters/app/modules/community/providers/community_provider.dart';
import 'package:moto_hunters/app/shared/controllers/searchable_list_controller.dart';
import 'package:get/get.dart';

class CommunityController extends SearchableListController<User> {
  // ignore: unused_field
  final CommunityProvider _communityProvider;

  final List<User> fakeList = List.generate(3, (index) => User.fake(index));

  CommunityController(this._communityProvider)
      : super(
            searchFilterFunc: (User el, String value) =>
                fullName(el).toLowerCase().contains(value.toLowerCase()),
            tipoFilterFunc: (User el, List<String> values) => true,
            marcaFilterFunc: (User el, List<String> values) => true,
            orderByFilterFunc: (List<User> els, OrderBy value) => els,
            providerFunc: _communityProvider.getUsers);

  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    skip = 0;
    super.onInit();
  }
}
