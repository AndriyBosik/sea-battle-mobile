import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/abstract_rating_page_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_loading_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_rating_loaded_state.dart';
import 'package:sea_battle_presentation/meta/arrow_button_direction.dart';
import 'package:sea_battle_presentation/presentation/component/animation/scaling_widget/scaling_widget.dart';
import 'package:sea_battle_presentation/presentation/component/arrow_button/arrow_button.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_loader/bomb_loader.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/bomb_scroll_box.dart';

class RatingView extends StatelessWidget {
  final AbstractRatingPageState _state;

  const RatingView({
    Key? key,
    required AbstractRatingPageState state
  }):
    _state = state,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScalingWidget(
              beginValue: 0.99,
              child: Image.asset(
                AppAsset.scrollImage,
                package: AppConst.packageName,
              ),
            )
          ),
          _mapStateToScrollContent(),
          Positioned(
            left: 10,
            bottom: 10,
            child: ArrowButton(
              onTap: () => Navigator.of(context).pop(),
              direction: ArrowButtonDirection.left,
              textKey: LocaleKey.back,
            )
          )
        ],
      ),
    );
  }

  Widget _mapStateToScrollContent() {
    if (_state is RatingPageLoadingState) {
      return const BombLoader();
    }
    if (_state is RatingPageRatingLoadedState) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 80, 0, 80),
        child: SizedBox(
          height: 400,
          width: 210,
          child: BombScrollBox(
            children: (_state as RatingPageRatingLoadedState).ratedUsers
              .map(_toRatedUserItem)
              .toList()
          ),
        )
      );
    }
    return Container();
  }

  Widget _toRatedUserItem(RatedUser user) {
    final String text = "${user.nickname}(${user.score})";
    return Text(
      text,
      style: GoogleFonts.getFont(
        SeaBattleTheme.primaryFont,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        shadows: const [
          Shadow(
              offset: Offset(1, 1),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0)
            )
        ]
      ),
    );
  }
}