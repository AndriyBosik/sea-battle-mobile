import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/meta/horizontal_position.dart';
import 'package:sea_battle_presentation/presentation/component/menu_item/menu_item.dart';

class Menu extends StatelessWidget {
  static final Color _centralCrossColor = Colors.black.withOpacity(0.2);

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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MenuItem(
              itemName: "Play",
              itemImage: AppAsset.pirateSwordsImage
            ),
            Container(
              height: 2,
              width: 100,
              color: _centralCrossColor,
            ),
            const MenuItem(
              itemName: "Rating",
              itemImage: AppAsset.cupImage
            ),
          ]
        ),
        Container(
          width: 2,
          height: 130,
          color: _centralCrossColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MenuItem(
              itemName: "Shop",
              itemImage: AppAsset.pirateBoxImage,
              imagePosition: HorizontalPosition.right,
            ),
            Container(
              height: 2,
              width: 100,
              color: _centralCrossColor,
            ),
            const MenuItem(
              itemName: "Settings",
              itemImage: AppAsset.wheelImage,
              imagePosition: HorizontalPosition.right,
            ),
          ],
        )
      ]
    );
  }

  Widget _firstTry() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MenuItem(
              itemName: "Play",
              itemImage: AppAsset.pirateSwordsImage
            ),
            Container(
              color: Colors.black,
              width: 3,
              height: 50,
            ),
            const MenuItem(
              itemName: "Shop",
              itemImage: AppAsset.pirateBoxImage,
              imagePosition: HorizontalPosition.right,
            )
          ]
        ),
        const SizedBox(
          // height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MenuItem(
              itemName: "Rating",
              itemImage: AppAsset.cupImage
            ),
            MenuItem(
              itemName: "Settings",
              itemImage: AppAsset.wheelImage,
              imagePosition: HorizontalPosition.right,
            )
          ]
        )
      ]
    );
  }
}