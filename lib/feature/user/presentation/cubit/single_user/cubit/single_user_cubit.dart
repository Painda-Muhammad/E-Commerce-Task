import 'package:e_commerce_task/feature/user/domain/use_case/single_user_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/update_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/user_entity.dart';

part 'single_user_state.dart';

class SingleUserCubit extends Cubit<SingleUserState> {
  SingleUserCubit(
      {required this.updateUserUsecase, required this.singleUserUsecase})
      : super(SingleUserInitial());

  final SingleUserUsecase singleUserUsecase;
  final UpdateUserUsecase updateUserUsecase;

  Future<void> getSingleUser(UserEntity user) async {
    try {
      emit(SingleUserLoading());
      final streamResponse = singleUserUsecase.call(user);
      streamResponse.listen(
        (users) => emit(SingleUserLoaded(singleUser: users.first)),
      );
    } catch (_) {
      emit(SingleUserFailure());
    }
  }

  Future<void> updateSingleUser(UserEntity user) async {
    try {
      emit(SingleUserLoading());
      await updateUserUsecase.call(user);
      emit(SingleUserLoaded(singleUser: user));
    } catch (_) {
      emit(SingleUserFailure());
    }
  }
}
