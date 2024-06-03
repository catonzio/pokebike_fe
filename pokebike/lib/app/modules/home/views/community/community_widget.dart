import 'package:flutter/material.dart';
import 'package:pokebike/app/modules/home/views/community/community_list.dart';
import 'package:pokebike/app/modules/home/views/community/community_title.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';

class CommunityWidget extends StatelessWidget {
  final double height;

  const CommunityWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          CommunityTitle(
            onTap: () => context.navigator.pushNamed(Routes.COMMUNITY),
          ),
          SizedBox(height: height * 0.75, child: const CommunityList()),
        ],
      ),
    );
  }
}
