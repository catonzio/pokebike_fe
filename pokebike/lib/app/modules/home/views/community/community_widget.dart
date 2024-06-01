import 'package:flutter/material.dart';
import 'package:pokebike/app/modules/home/views/community/community_list.dart';
import 'package:pokebike/app/modules/home/views/community/community_title.dart';

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
            onTap: () => print("vedi tutti"),
          ),
          SizedBox(height: height * 0.75, child: const CommunityList()),
        ],
      ),
    );
  }
}
