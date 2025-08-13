import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/data/search_options.dart';
import 'package:moto_hunters/app/modules/community/views/community_title.dart';
import 'package:moto_hunters/app/shared/widgets/search_row/search_row.dart';
import 'package:moto_hunters/app/modules/community/views/community_list.dart';
import 'package:moto_hunters/app/shared/default_page.dart';

import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultPage(
          body: _buildBody(),
          fabOnTap: controller.showFAB
              ? () => controller.scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate)
              : null,
        ));
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommunityTitle(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchRow(
            onSearchField: _onSearchField,
            onSave: _onSave,
            focusNode: controller.focusNode,
            controller: controller.searchController,
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
    );
  }

  void _onSearchField(String value) {
    controller.filter(searchS: value);
  }

  void _onSave(SearchOptions options) {
    controller.filter(options: options);
  }
}
