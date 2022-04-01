import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/default/default_state.dart';

class DefaultCubit extends BaseCubit<DefaultState> {
  DefaultCubit() : super(DefaultState());
}