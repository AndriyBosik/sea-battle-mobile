import 'package:flutter/material.dart';

class SeaBattleApp extends StatelessWidget {
  final Widget _home;

  const SeaBattleApp({
    Key? key,
    required Widget home
  }):
    _home = home,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _home
    );
  }
}