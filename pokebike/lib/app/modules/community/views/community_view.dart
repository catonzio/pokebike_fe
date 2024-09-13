import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/data/search_options.dart';
import 'package:pokebike/app/modules/community/views/community_title.dart';
import 'package:pokebike/app/shared/widgets/search_row/search_row.dart';
import 'package:pokebike/app/modules/community/views/community_list.dart';
import 'package:pokebike/app/shared/default_page.dart';

import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommunityTitle(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchRow(
            onSearchField: _onSearchField,
            onSave: _onSave,
            focusNode: controller.focusNode,
            showButton: false,
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CommunityList(),
          ),
        ),
      ],
    ));
  }

  void _onSearchField(String value) {
    controller.filter(searchS: value);
  }

  void _onSave(SearchOptions options) {
    controller.filter(options: options);
  }
}
