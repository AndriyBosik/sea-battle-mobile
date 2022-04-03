import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';

class BonesCheckbox extends StatelessWidget {
  final bool _isChecked;
  final void Function()? _onCheckboxTapped;

  const BonesCheckbox({
    Key? key,
    bool isChecked = false,
    void Function()? onCheckboxTapped
  }):
    _isChecked = isChecked,
    _onCheckboxTapped = onCheckboxTapped,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onCheckboxTapped,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Image.asset(
          _getImageByStatus(),
          key: UniqueKey(),
          package: AppConst.packageName,
          width: 60,
        )
      )
    );
  }

  String _getImageByStatus() {
    return _isChecked ? AppAsset.checkboxCheckedImage : AppAsset.checkboxUncheckedImage;
  }
}