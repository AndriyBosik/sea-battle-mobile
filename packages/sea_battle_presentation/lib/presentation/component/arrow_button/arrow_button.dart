import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/meta/arrow_button_direction.dart';
import 'package:sea_battle_presentation/meta/text_case.dart';
import 'package:sea_battle_presentation/presentation/component/animation/scaling_widget/scaling_widget.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_text/locale_text.dart';

class ArrowButton extends StatefulWidget {
  final TextKey _textKey;
  final ArrowButtonDirection _direction;
  final void Function()? _onTap;

  const ArrowButton({
    Key? key,
    required TextKey textKey,
    void Function()? onTap,
    ArrowButtonDirection direction = ArrowButtonDirection.right
  }):
    _textKey = textKey,
    _direction = direction,
    _onTap = onTap,
    super(key: key);

  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> with TickerProviderStateMixin {
  static const double _shadowOffset = 3;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this);
    animation = Tween<double>(begin: 0, end: _shadowOffset).animate(controller)
      ..addListener(() {
        setState(() {
          
        });
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _getArrow(),
        Padding(
          padding: widget._direction == ArrowButtonDirection.right ? const EdgeInsets.only(right: 12) : const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTapDown: _buttonPressed,
            onTap: widget._onTap,
            child: LocaleText(
              textKey: widget._textKey,
              textCase: TextCase.uppercase,
              style: GoogleFonts.getFont(
                SeaBattleTheme.primaryFont,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: _getOffset(),
                    blurRadius: 3.0,
                    color: const Color.fromARGB(255, 0, 0, 0)
                  )
                ]
              )
            )
          )
        )
      ]
    );
  }

  Offset _getOffset() {
    if (controller.status == AnimationStatus.completed) {
      return const Offset(_shadowOffset, _shadowOffset);
    }
    return Offset(_shadowOffset - animation.value, _shadowOffset - animation.value);
  }

  Widget _getArrow() {
    Widget image = Image.asset(
      AppAsset.boardArrowImage,
      height: 100,
      package: AppConst.packageName,
    );
    return widget._direction == ArrowButtonDirection.right ? image : Transform(
      transform: Matrix4.rotationY(pi),
      alignment: Alignment.center,
      child: ScalingWidget(
        beginValue: 0.95,
        child: image
      )
    );
  }

  void _buttonPressed(TapDownDetails tapDownDetails) {
    controller.reset();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}