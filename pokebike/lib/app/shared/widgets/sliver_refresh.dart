import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverRefresh extends StatelessWidget {
  final Future<void> Function()? onRefresh;

  const SliverRefresh({
    super.key,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      refreshTriggerPullDistance: 200,
      builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance,
          refreshIndicatorExtent) {
        if ([RefreshIndicatorMode.armed, RefreshIndicatorMode.refresh]
            .contains(refreshState)) {
          return const Center(child: CircularProgressIndicator());
        } else if (refreshState == RefreshIndicatorMode.inactive) {
          return const SizedBox.shrink();
        } else if (refreshState == RefreshIndicatorMode.drag) {
          return Center(
            child: CircularProgressIndicator(
              value: pulledExtent / refreshTriggerPullDistance,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
