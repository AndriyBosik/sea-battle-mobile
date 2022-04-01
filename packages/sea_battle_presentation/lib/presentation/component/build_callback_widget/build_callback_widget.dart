import 'package:flutter/material.dart';

abstract class BuildCallbackWidget extends StatelessWidget {
  const BuildCallbackWidget({
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) => onFirstBuild());
    return buildContent(context);
  }

  @protected
  void onFirstBuild();

  @protected
  Widget buildContent(BuildContext context);
}