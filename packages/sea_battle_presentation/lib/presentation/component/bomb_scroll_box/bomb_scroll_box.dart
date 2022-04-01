import 'package:flutter/material.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/scroll_list/scroll_list.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/scroll_track/scroll_track.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/track/track.dart';
import 'package:sea_battle_presentation/utils/scroll_box_utils.dart';

class BombScrollBox extends StatefulWidget {
  final List<Widget> _children;
  final void Function()? _onLastItemScrolled;

  const BombScrollBox({
    Key? key,
    required List<Widget> children,
    void Function()? onLastItemScrolled
  }):
    _children = children,
    _onLastItemScrolled = onLastItemScrolled,
    super(key: key);

  @override
  _BombScrollBoxState createState() => _BombScrollBoxState();
}

class _BombScrollBoxState extends State<BombScrollBox> {
  static const double _scrollTrackPadding = 20;
  static const double _trackSize = 40;
  static const double _scrollTrackWidth = 4;

  final GlobalKey _scrollTrackWidgetKey = GlobalKey();
  final GlobalKey _trackWidgetKey = GlobalKey();
  double _trackPosition = 0;
  bool _isNotifiedAboutLastItemScrolled = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: _drawListAndScroll(constraints.maxHeight),
        );
      }
    );
  }

  List<Widget> _drawListAndScroll(double maxHeight) {
    Widget scrollList = ScrollList(
      onScrollNotification: _onScrollNotification,
      maxHeight: maxHeight,
      scrollController: _scrollController,
      children: widget._children);
    return [
      scrollList,
      ScrollTrack(
        scrollTrackKey: _scrollTrackWidgetKey,
        verticalPadding: _scrollTrackPadding,
        right: ScrollBoxUtils.calculateRightPositionForScrollTrack(
          trackWidth: _trackSize,
          scrollTrackWidth: _scrollTrackWidth
        ),
        height: maxHeight,
        width: _scrollTrackWidth,
      ),
      Track(
        trackKey: _trackWidgetKey,
        trackPosition: _trackPosition,
        trackSize: _trackSize,
        onVerticalDragUpdate: _onVerticalDragUpdate
      )
    ];
  }

  void _onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    setState(() {
      final double maxExtent = _scrollController.position.maxScrollExtent;
      final ScrollBarContext scrollBarContext = ScrollBoxUtils.calculateTrackPositionOnDrag(
        scrollTrackWidgetKey: _scrollTrackWidgetKey,
        trackWidgetKey: _trackWidgetKey,
        dragUpdateDetails: dragUpdateDetails,
        scrollHeight: maxExtent);
      final double currentExtent = scrollBarContext.scrollControllerValue;
      _trackPosition = scrollBarContext.trackPosition + _scrollTrackPadding;
      _scrollController.jumpTo(scrollBarContext.scrollControllerValue);

      if (currentExtent < maxExtent) {
        _isNotifiedAboutLastItemScrolled = false;
      }
    });
  }

  bool _onScrollNotification(ScrollNotification? notification) {
    final ScrollExtentContext extentContext = _getScrollExtentContext(notification);
    _callLastItemScrolledCallback(extentContext: extentContext);
    setState(() {
      _trackPosition = _scrollTrackPadding + ScrollBoxUtils.calculateTrackPositionByExtents(
        scrollTrackWidgetKey: _scrollTrackWidgetKey,
        trackWidgetKey: _trackWidgetKey,
        extentContext: extentContext
      );
      _isNotifiedAboutLastItemScrolled = _refreshNotifiedFlagValue(extentContext: extentContext);
    });
    return true;
  }

  void _callLastItemScrolledCallback({
      required ScrollExtentContext extentContext
  }) {
    if (extentContext.currentExtent > extentContext.maxExtent && !_isNotifiedAboutLastItemScrolled && widget._onLastItemScrolled != null) {
      widget._onLastItemScrolled!();
    }
  }

  bool _refreshNotifiedFlagValue({
      required ScrollExtentContext extentContext
  }) {
    return extentContext.currentExtent > extentContext.maxExtent;
  }

  ScrollExtentContext _getScrollExtentContext(ScrollNotification? notification) {
    if (notification == null) {
      return ScrollExtentContext(
        currentExtent: _scrollController.position.extentBefore,
        maxExtent: _scrollController.position.maxScrollExtent
      );
    }
    return ScrollExtentContext(
      currentExtent: notification.metrics.extentBefore,
      maxExtent: notification.metrics.maxScrollExtent
    );
  }
}