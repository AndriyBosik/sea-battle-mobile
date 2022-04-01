import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/controller/cubit/rating_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/abstract_rating_page_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_initial_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_users_state.dart';
import 'package:sea_battle_presentation/meta/arrow_button_direction.dart';
import 'package:sea_battle_presentation/meta/loading_status.dart';
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
        children: _getContent(context),
      ),
    );
  }

  List<Widget> _getContent(BuildContext context) {
    List<Widget> content = [_getRatedUsersScroll()];
    if (_state is RatingPageInitialState || _state is! RatingPageUsersState) {
      return content + [_getArrowButton(context)];
    }
    RatingPageUsersState state = _state as RatingPageUsersState;
    content += [_mapRatedUsersToScrollContent(context, state.ratedUsers)];
    if (state.loadingStatus == LoadingStatus.loading) {
      content += [const BombLoader()];
    }
    return content + [_getArrowButton(context)];
  }

  Widget _getRatedUsersScroll() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ScalingWidget(
        beginValue: 0.98,
        child: RotatedBox(
          quarterTurns: 3,
          child: Image.asset(
            AppAsset.scrollImage,
            package: AppConst.packageName,
          )
        ),
      )
    );
  }

  Widget _mapRatedUsersToScrollContent(BuildContext context, List<RatedUser> ratedUsers) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 80, 0, 80),
      child: SizedBox(
        height: 400,
        width: 300,
        child: BombScrollBox(
          onLastItemScrolled: () {
            BlocProvider.of<RatingPageCubit>(context).loadAdditionalUsers();
          },
          children: ratedUsers.asMap().entries
            .map(_toRatedUserItem)
            .toList()
        ),
      )
    );
  }

  Widget _toRatedUserItem(MapEntry<int, RatedUser> entry) {
    final int position = entry.key + 1;
    final RatedUser user = entry.value;
    return Row(
      children: [
        _getTextWidget("$position. ${user.nickname}"),
        Expanded(child: Container()),
        _getTextWidget(user.score.toString())
      ],
    );
  }

  Text _getTextWidget(String text) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        SeaBattleTheme.primaryFont,
        color: Colors.white,
        fontSize: 17,
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

  Widget _getArrowButton(BuildContext context) {
    return Positioned(
      left: 10,
      bottom: 10,
      child: ArrowButton(
        onTap: () => Navigator.of(context).pop(),
        direction: ArrowButtonDirection.left,
        textKey: LocaleKey.back,
      )
    );
  }
}