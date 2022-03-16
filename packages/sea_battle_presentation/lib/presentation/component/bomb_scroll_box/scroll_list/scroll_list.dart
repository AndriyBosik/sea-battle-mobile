import 'package:flutter/material.dart';

class ScrollList extends StatelessWidget {
  final bool Function(ScrollNotification notification) _onScrollNotification;
  final double _maxHeight;
  final ScrollController _scrollController;
  final List<Widget> _children;

  const ScrollList({
    Key? key,
    required bool Function(ScrollNotification notification) onScrollNotification,
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
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