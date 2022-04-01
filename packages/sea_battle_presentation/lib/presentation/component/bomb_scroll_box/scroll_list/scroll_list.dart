import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/build_callback_widget/build_callback_widget.dart';

class ScrollList extends BuildCallbackWidget {
  final bool Function(ScrollNotification? notification) _onScrollNotification;
  final double _maxHeight;
  final ScrollController _scrollController;
  final List<Widget> _children;

  const ScrollList({
    Key? key,
    required bool Function(ScrollNotification? notification) onScrollNotification,
    required double maxHeight,
    required ScrollController scrollController,
    required List<Widget> children
  }):
    _onScrollNotification = onScrollNotification,
    _maxHeight = maxHeight,
    _scrollController = scrollController,
    _children = children,
    super(key: key);

  @override
  void onFirstBuild() {
    _onScrollNotification(null);
  }

  @override
  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: NotificationListener<ScrollNotification>(
        onNotification: _onScrollNotification,
        child: SizedBox(
          height: _maxHeight,
          child: ListView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            children: _children
          )
        )
      )
    );
  }
}