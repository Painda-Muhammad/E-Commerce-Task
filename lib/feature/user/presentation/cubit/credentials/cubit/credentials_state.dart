part of 'credentials_cubit.dart';

sealed class CredentialsState extends Equatable {
  const CredentialsState();

  @override
  List<Object> get props => [];
}

final class CredentialsInitial extends CredentialsState {}
final class CredentialsLoading extends CredentialsState{}
final class CredentialsSucess extends CredentialsState{
  // const CredentialsLoaded({required this.userEntity});
  // final List<UserEntity> userEntity;

  // @override
  // List<Object> get props => [userEntity];
}
final class CredentialsFailure extends CredentialsState{}
