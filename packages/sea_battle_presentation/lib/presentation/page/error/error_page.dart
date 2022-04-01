import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/page/default_page_widget.dart';

class ErrorPage extends DefaultPageWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  List<Widget> getContent(BuildContext context) {
    return const [
      Text(
        "Error",
        style: TextStyle(
          fontSize: 70
        ),
      )
    ];
  }
}