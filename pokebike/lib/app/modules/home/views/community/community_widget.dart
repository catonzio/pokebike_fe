import 'package:flutter/material.dart';
import 'package:moto_hunters/app/modules/community/views/community_title.dart';
import 'package:moto_hunters/app/modules/community/views/community_list.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';

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
            onTap: () => context.pushNamed(Routes.COMMUNITY),
          ),
          SizedBox(
              height: height * 0.75,
              child: const CommunityList(
                isHorizontal: true,
              )),
        ],
      ),
    );
  }
}
