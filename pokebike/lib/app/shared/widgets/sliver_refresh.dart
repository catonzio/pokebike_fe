import 'package:flutter/cupertino.dart';
import 'package:moto_hunters/app/shared/widgets/paginator_widget.dart';
import 'package:get/get.dart';

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
          return const Center(child: MCircularProgressIndicator());
        } else if (refreshState == RefreshIndicatorMode.inactive) {
          return const SizedBox.shrink();
        } else if (refreshState == RefreshIndicatorMode.drag) {
          return Center(
            child: MCircularProgressIndicator(
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
