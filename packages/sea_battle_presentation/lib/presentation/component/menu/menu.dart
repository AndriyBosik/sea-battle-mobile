import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/meta/horizontal_position.dart';
import 'package:sea_battle_presentation/presentation/component/menu_item/menu_item.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            MenuItem(
              itemName: "Play",
              itemImage: AppAsset.pirateSwordsImage
            ),
            MenuItem(
              itemName: "Rating",
              itemImage: AppAsset.cupImage
            ),
          ]
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MenuItem(
              itemName: "Shop",
              itemImage: AppAsset.pirateBoxImage,
              imagePosition: HorizontalPosition.right,
            ),
            MenuItem(
              itemName: "Settings",
              itemImage: AppAsset.wheelImage,
              imagePosition: HorizontalPosition.right,
            ),
          ],
        )
      ]
    );
  }
}