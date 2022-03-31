import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/controller/cubit/rating_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/abstract_rating_page_state.dart';
import 'package:sea_battle_presentation/presentation/component/background/background.dart';
import 'package:sea_battle_presentation/presentation/view/rating/rating_view.dart';

class RatingPage extends StatelessWidget {
  final UserService _userService;

  const RatingPage({
    Key? key,
    required UserService userService
  }):
    _userService = userService,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatingPageCubit>(
      create: (_) => RatingPageCubit(
        userService: _userService
      )..loadRating(),
      child: BlocBuilder<RatingPageCubit, AbstractRatingPageState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const Background(
                  imageName: AppAsset.backgroundImage
                ),
                RatingView(
                  state: state
                )
              ],
            ),
          );
        },
      )
    );
  }
}