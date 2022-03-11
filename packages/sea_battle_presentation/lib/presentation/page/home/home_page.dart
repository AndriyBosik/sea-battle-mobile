import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/logic/cubit/abstract_loading_cubit.dart';
import 'package:sea_battle_presentation/logic/cubit/user_profile_loading_cubit.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/component/ship_loading/ship_loading.dart';

class HomePage extends StatefulWidget {
  final UserProfileLoadingCubit _userProfileLoadingCubit;

  const HomePage({
    Key? key,
    required UserProfileLoadingCubit userProfileLoadingCubit
  }):
    _userProfileLoadingCubit = userProfileLoadingCubit,
    super(key: key);

  @override
  _HomePageState createState() => _HomePageState(
    userProfileLoadingCubit: _userProfileLoadingCubit
  );
}

class _HomePageState extends State<HomePage> {
  final UserProfileLoadingCubit _userProfileLoadingCubit;

  bool _isLoaded = false;

  _HomePageState({
    required UserProfileLoadingCubit userProfileLoadingCubit
  }):
    _userProfileLoadingCubit = userProfileLoadingCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _userProfileLoadingCubit.loadUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded) {
      return const Text("Loaded");
    }
    return BlocProvider<AbstractLoadingCubit>(
      create: (_) => _userProfileLoadingCubit,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            const AppBackground(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ShipLoading(
                  onLoadedCallback: () {
                    setState(() {
                      _isLoaded = true;
                    });
                  }
                )
              )
            )
          ],
        )
      ),
    );
  }
}