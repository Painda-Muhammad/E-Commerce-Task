import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/forgot_password_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/login_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/signup_usecase.dart';

import 'package:equatable/equatable.dart';

import '../../../../domain/use_case/google_auth_usecase.dart';

part 'credentials_state.dart';

class CredentialsCubit extends Cubit<CredentialsState> {
  CredentialsCubit({
    required this.logInUsecase,
    required this.signUpUsecase,
    required this.forgotPasswordUsecase,
    required this.googleAuthUsecase,
  }) : super(CredentialsInitial());

  final LogInUsecase logInUsecase;
  final SignUpUsecase signUpUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final GoogleAuthUsecase googleAuthUsecase;

  Future<void> logInSubmit(
      {required String email, required String password}) async {
    emit(CredentialsLoading());
    try {
      await logInUsecase.call(UserEntity(email: email, password: password));
      emit(CredentialsSucess());
    } on SocketException catch (_) {
      emit(CredentialsFailure());
    } catch (_) {
      emit(CredentialsFailure());
    }
  }

  Future<void> signUpSubmit(UserEntity user) async {
    emit(CredentialsLoading());
    try {
      await signUpUsecase.call(user);
      emit(CredentialsSucess());
    } on SocketException catch (_) {
      emit(CredentialsFailure());
    } catch (_) {
      emit(CredentialsFailure());
    }
  }

  Future<void> forgotPasswordSubmit({required String email}) async {
    try {
      await forgotPasswordUsecase.call(email);
    } on SocketException catch (_) {
      emit(CredentialsFailure());
    } catch (_) {
      emit(CredentialsFailure());
    }
  }

  Future<void> googleSignInSubmit() async {
    emit(CredentialsLoading());
    try {
      await googleAuthUsecase.call();
      emit(CredentialsSucess());
    } on SocketException catch (_) {
      emit(CredentialsFailure());
    } catch (_) {
      emit(CredentialsFailure());
    }
  }
}
