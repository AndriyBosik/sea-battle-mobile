import 'package:flutter/material.dart';
import 'package:sea_battle_dto/dto/scroll_bar_context.dart';
import 'package:sea_battle_dto/dto/widget_constraints.dart';
import 'package:sea_battle_presentation/utils/math_utils.dart';
import 'package:sea_battle_presentation/utils/widget_utils.dart';

class ScrollBoxUtils {
  static double fixTrackPosition(double trackPosition, double maxHeight) {
    if (trackPosition > maxHeight) {
      return maxHeight;
    } else if (trackPosition < 0) {
      return 0;
    }
    return trackPosition;
  }

  static double calculateTrackPositionOnNotification({
    required GlobalKey scrollTrackWidgetKey,
    required GlobalKey trackWidgetKey,
    required ScrollNotification notification
  }) {
    final WidgetConstraints scrollTrackConstraints = WidgetUtils.getWidgetConstraints(scrollTrackWidgetKey);
    final WidgetConstraints trackConstraints = WidgetUtils.getWidgetConstraints(trackWidgetKey);
    final double maxHeight = scrollTrackConstraints.size.height;
    final scrollTrackPosition = maxHeight*notification.metrics.extentBefore/notification.metrics.maxScrollExtent;
    return ScrollBoxUtils.fixTrackPosition(scrollTrackPosition, maxHeight) - trackConstraints.size.height / 2;
  }

  static ScrollBarContext calculateTrackPositionOnDrag({
    required GlobalKey scrollTrackWidgetKey,
    required GlobalKey trackWidgetKey,
    required DragUpdateDetails dragUpdateDetails,
    required double scrollHeight
  }) {
    final WidgetConstraints scrollTrackConstraints = WidgetUtils.getWidgetConstraints(scrollTrackWidgetKey);
    final WidgetConstraints trackConstraints = WidgetUtils.getWidgetConstraints(trackWidgetKey);
    final double minTop = scrollTrackConstraints.offset.dy;
    final double maxTop = minTop + scrollTrackConstraints.size.height;
    final double dragPosition = dragUpdateDetails.globalPosition.dy;
    
    if (MathUtils.areSequential(minTop, dragPosition, maxTop)) {
      final double scrollPosition = scrollHeight*(dragPosition - minTop)/(maxTop - minTop);
      final double trackPosition = dragPosition - minTop - trackConstraints.size.height / 2;
      return ScrollBarContext(
        scrollControllerValue: scrollPosition,
        trackPosition: trackPosition
      );
    } else if (dragPosition < minTop) {
      return ScrollBarContext(
        trackPosition: -trackConstraints.size.height / 2,
        scrollControllerValue: 0
      );
    } else {
      return ScrollBarContext(
        trackPosition: maxTop - minTop - trackConstraints.size.height / 2,
        scrollControllerValue: scrollHeight
      );
    }
  }

  static bool isScrollTrackNeeded(ScrollController scrollController) {
    return scrollController.position.maxScrollExtent > 0;
  }

  static double calculateRightPositionForScrollTrack({
    required double trackWidth,
    required double scrollTrackWidth
  }) {
    return trackWidth / 2 - scrollTrackWidth / 2;
  }
}