import 'package:flutter/material.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/meta/horizontal_position.dart';
import 'package:sea_battle_presentation/presentation/component/menu/play/play.dart';
import 'package:sea_battle_presentation/presentation/component/menu/rating/rating.dart';
import 'package:sea_battle_presentation/presentation/component/menu/settings/settings.dart';
import 'package:sea_battle_presentation/presentation/component/menu/shop/shop.dart';
import 'package:sea_battle_presentation/presentation/component/menu_item/menu_item.dart';

class Menu extends StatelessWidget {
  final MenuClickListeners _menuClickListeners;

  const Menu({
    Key? key,
    required MenuClickListeners menuClickListeners
  }):
    _menuClickListeners = menuClickListeners,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MenuItem(
              textKey: LocaleKey.play,
              child: Play()
            ),
            MenuItem(
              textKey: LocaleKey.rating,
              child: const Rating(),
              onClick: _menuClickListeners.onRatingClick,
            ),
          ]
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MenuItem(
              textKey: LocaleKey.shop,
              child: Shop(),
              imagePosition: HorizontalPosition.right,
            ),
            MenuItem(
              textKey: LocaleKey.settings,
              child: const Settings(),
              imagePosition: HorizontalPosition.right,
              onClick: _menuClickListeners.onSettingsClick,
            ),
          ],
        )
      ]
    );
  }
}