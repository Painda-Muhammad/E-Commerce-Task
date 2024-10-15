import 'dart:io';

import 'package:e_commerce_task/feature/user/domain/use_case/is_login_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/signout_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_case/current_user_id_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._isLogInUsecase, this._signOutUsecase, this._userIdUsecase)
      : super(AuthInitial());

  final IsLogInUsecase _isLogInUsecase;
  final SignOutUsecase _signOutUsecase;
  final CurrentUserIdUsecase _userIdUsecase;

  Future appStarted() async {
    try {
      var isLogin = await _isLogInUsecase.call();
      if (isLogin == true) {
        final uid = await _userIdUsecase.call();
        emit(Authenticated(uid: uid));
      }
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await _signOutUsecase.call();
      emit(UnAuthenticated());
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await _userIdUsecase.call();

      emit(Authenticated(uid: uid));
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
