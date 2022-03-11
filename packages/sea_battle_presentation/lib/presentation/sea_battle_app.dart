import 'package:flutter/material.dart';

class SeaBattleApp extends StatelessWidget {
  final Widget _body;

  const SeaBattleApp({
    Key? key,
    required Widget body
  }):
    _body = body,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _body
    );
  }
}