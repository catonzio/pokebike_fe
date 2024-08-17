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
import 'package:skeletonizer/skeletonizer.dart';

class CommunityList extends StatelessWidget {
  final bool isHorizontal;
  const CommunityList({super.key, this.isHorizontal = false});

  void initState(GetXState<CommunityController> state) {
    state.controller
        ?.fetchUsers()
        .then((value) => handleApiResponse(state.context, value));
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CommunityController>(
        initState: initState,
        builder: (CommunityController controller) {
          final List<Widget> children = (controller.isLoading
                  ? controller.fakeCommunities
                  : (isHorizontal
                      ? controller.communities
                      : controller.filteredCommunities))
              .map((User e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommunityTile(
                      index: e.id,
                      text: fullName(e),
                      imagePath: e.motoFavoritaAvatar,
                      profileImagePath: e.avatar,
                      onTap: () => context.navigator.pushNamed(
                        Routes.PROFILE,
                        arguments: ProfileArguments(user: e),
                      ),
                    ),
                  ))
              .toList();

          return Skeletonizer(
            enabled: controller.isLoading,
            child: children.isEmpty
                ? const Center(child: Text("La community è vuota"))
                : isHorizontal
                    ? ListView(
                        itemExtent: context.width * 0.45,
                        scrollDirection: Axis.horizontal,
                        children: children.sublist(0,
                            min(children.length, Constants.numCommunityHome)))
                    : RefreshIndicator(
                        onRefresh: () => controller.fetchUsers(reload: true),
                        child: GridView(
                            padding: const EdgeInsets.only(
                                bottom: Constants.bottomNavbarHeight),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                            ),
                            children: children),
                      ),
          );
        });
  }
}
