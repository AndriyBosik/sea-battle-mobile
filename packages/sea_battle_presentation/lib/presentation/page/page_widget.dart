import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/presentation/component/background/background.dart';

abstract class PageWidget<T extends BaseCubit> extends StatelessWidget {
  final Color _backgroundColor;
  final String? _backgroundImage;

  const PageWidget({
    Key? key,
    Color backgroundColor = Colors.transparent,
    String? backgroundImage = AppAsset.backgroundImage
  }):
    _backgroundColor = backgroundColor,
    _backgroundImage = backgroundImage,
    super(key: key);

  @protected
  T createCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) {
        final T cubit = createCubit();
        cubit.onCreate();
        return cubit;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _backgroundColor,
        body: Stack(
          children: _getBackground() + getContent(context),
        ),
      ),
    );
  }

  List<Widget> _getBackground() {
    if (_backgroundImage == null) {
      return [];
    }
    return [
      Background(
        imageName: _backgroundImage!
      )
    ];
  }

  @protected
  List<Widget> getContent(BuildContext context);
}