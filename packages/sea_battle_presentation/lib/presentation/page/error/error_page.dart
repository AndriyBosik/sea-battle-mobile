import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Error",
      style: TextStyle(
        fontSize: 70
      ),
    );
  }
}