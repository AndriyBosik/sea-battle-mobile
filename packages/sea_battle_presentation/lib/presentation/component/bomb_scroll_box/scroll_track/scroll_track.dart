import 'package:flutter/material.dart';

class ScrollTrack extends StatelessWidget {
  final GlobalKey _scrollTrackKey;
  final double _verticalPadding;
  final double _right;
  final double _height;
  final double _width;

  const ScrollTrack({
    Key? key,
    required GlobalKey scrollTrackKey,
    required double verticalPadding,
    required double right,
    required double height,
    required double width
  }):
    _scrollTrackKey = scrollTrackKey,
    _verticalPadding = verticalPadding,
    _right = right,
    _height = height,
    _width = width,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: _right,
      height: _height,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: _verticalPadding),
        child: Container(
          key: _scrollTrackKey,
          height: double.infinity,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius: 4)
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: _width,
              color: const Color(0xFFd0b272)
            )
          ),
        )
      )
    );
  }
}