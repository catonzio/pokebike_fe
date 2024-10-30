import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/config/constants.dart';
import 'package:pokebike/app/data/models/user/user.dart';
import 'package:pokebike/app/modules/community/controllers/community_controller.dart';
import 'package:pokebike/app/modules/profile/profile_arguments.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';
import 'package:pokebike/app/modules/community/views/community_tile.dart';
import 'package:pokebike/app/shared/widgets/paginator_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommunityList extends StatelessWidget {
  final bool isHorizontal;
  const CommunityList({super.key, this.isHorizontal = false});

  void initState(GetXState<CommunityController> state) {
    state.controller?.initialFetch().then((value) =>
        state.context.mounted ? handleApiResponse(state.context, value) : null);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CommunityController>(
        initState: initState,
        builder: (CommunityController controller) {
          final List<Widget> children = (controller.isFetching
                  ? controller.fakeList
                  : (isHorizontal ? controller.list : controller.filteredList))
              .map((User e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommunityTile(
                      index: e.id,
                      text: fullName(e),
                      imagePath: e.motoFavoritaAvatar,
                      profileImagePath: e.avatar,
                      onTap: () {
                        controller.focusNode.unfocus();
                        context.navigator.pushNamed(
                          Routes.PROFILE,
                          arguments: ProfileArguments(user: e),
                        );
                      },
                    ),
                  ))
              .toList();

          return Skeletonizer(
            enabled: controller.isFetching,
            child: children.isEmpty
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Text('emptyCommunity'.tr))
                : isHorizontal
                    ? HorizontalCommunityList(children: children)
                    : RefreshIndicator(
                        onRefresh: controller.refreshList,
                        child: PaginatorWidget(
                          body: VerticalCommunityList(
                              controller: controller, children: children),
                          showIndicator: controller.isFetchingOthers,
                        ),
                      ),
          );
        });
  }
}

class VerticalCommunityList extends StatelessWidget {
  final CommunityController controller;
  const VerticalCommunityList({
    super.key,
    required this.controller,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: controller.scrollController,
        padding: const EdgeInsets.only(bottom: Constants.bottomNavbarHeight),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
        ),
        children: children);
  }
}

class HorizontalCommunityList extends StatelessWidget {
  const HorizontalCommunityList({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
        itemExtent: context.width * 0.45,
        scrollDirection: Axis.horizontal,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: children.sublist(
            0, min(children.length, Constants.numCommunityHome)));
  }
}
