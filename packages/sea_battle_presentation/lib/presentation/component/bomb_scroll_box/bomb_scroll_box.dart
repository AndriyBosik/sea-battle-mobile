import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/dto/scroll_bar_context.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/scroll_list/scroll_list.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/scroll_track/scroll_track.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/track/track.dart';
import 'package:sea_battle_presentation/utils/scroll_box_utils.dart';

class BombScrollBox extends StatefulWidget {
  final List<Widget> _children;

  const BombScrollBox({
    Key? key,
    required List<Widget> children
  }):
    _children = children,
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
  bool isScrollVisible = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => setState(() {
          isScrollVisible = ScrollBoxUtils.isScrollTrackNeeded(_scrollController);
        }));
  }

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
    if (!isScrollVisible) {
      return [scrollList];
    }
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
      final ScrollBarContext scrollBarContext = ScrollBoxUtils.calculateTrackPositionOnDrag(
        scrollTrackWidgetKey: _scrollTrackWidgetKey,
        trackWidgetKey: _trackWidgetKey,
        dragUpdateDetails: dragUpdateDetails,
        scrollHeight: _scrollController.position.maxScrollExtent);
      _trackPosition = scrollBarContext.trackPosition + _scrollTrackPadding;
      _scrollController.jumpTo(scrollBarContext.scrollControllerValue);
    });
  }

  bool _onScrollNotification(ScrollNotification notification) {
    setState(() {
      _trackPosition = _scrollTrackPadding + ScrollBoxUtils.calculateTrackPositionOnNotification(
        scrollTrackWidgetKey: _scrollTrackWidgetKey,
        trackWidgetKey: _trackWidgetKey,
        notification: notification
      );
    });
    return true;
  }
}