import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/meta/popup_status.dart';
import 'package:sea_battle_presentation/presentation/component/popup/popup_controller.dart';

class Popup extends StatefulWidget {
  final bool _isHidden;
  final Widget _child;
  final Widget? _bottomContent;
  final PopupController? _popupController;
  
  const Popup({
    Key? key,
    bool isHidden = true,
    PopupController? popupController,
    Widget? bottomContent,
    required Widget child,
  }):
    _isHidden = isHidden,
    _popupController = popupController,
    _bottomContent = bottomContent,
    _child = child,
    super(key: key);
  
  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  late bool _isHidden;

  @override
  void initState() {
    super.initState();
    _isHidden = widget._isHidden;
    if (widget._popupController != null) {
      widget._popupController!.statusStream.listen((popupStatus) {
        setState(() {
          _isHidden = popupStatus == PopupStatus.hide;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (child, animation) {
        return Container(
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.white.withOpacity(0.4),
          child: ScaleTransition(
            scale: animation,
            child: child
          )
        );
      },
      child: _isHidden ? null : Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAsset.pirateMapImage,
              package: AppConst.packageName,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 40 + (widget._bottomContent == null ? 0 : 30)
              ),
              child: widget._child,
            ),
            Positioned(
              bottom: 40,
              child: widget._bottomContent ?? Container()
            )
          ]
        ),
      )
    );
  }
}