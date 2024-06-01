import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/search_row.dart';
import 'package:pokebike/app/modules/community/views/whole_community_list.dart';
import 'package:pokebike/app/shared/default_page.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultPage(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: ShimmerTitle(
              text: "Community",
              colors: [Colors.white, Colors.grey, Colors.white]),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: SearchRow(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: WholeCommunityList(),
          ),
        ),
      ],
    ));
  }
}
